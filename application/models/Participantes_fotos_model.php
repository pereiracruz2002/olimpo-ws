<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Participantes_fotos_model extends MY_Model
{
    var $id_col = 'participante_foto_id';
    
    public function __construct() {
        parent::__construct();
        $this->load->library('lib_recognition');
    }
    
    public function add($participante, $upload_data, $train=true, $face=false, $atual=0) 
    {
        if(!$participante->personId){
            $userdata = array(
                'nome' => $participante->nome, 
                'email' => $participante->email, 
                'criacao' => date('Y-m-d H:i:s')
            );

            $register = $this->lib_recognition->createPerson(PERSONGROUP, $participante->nome, json_encode($userdata));
            if(isset($register->error)){
                if($register->error->code == 'PersonGroupNotFound'){
                    $group = $this->lib_recognition->createPersonGroup(PERSONGROUP, strtoupper(PERSONGROUP));
                    $register = $this->lib_recognition->createPerson(PERSONGROUP, $participante->nome, json_encode($userdata));
                }
            }
            $this->db->update('participantes', array('personId' => $register->personId), array('participante_id' => $participante->participante_id));
            $participante->personId = $register->personId;
        }
        if(is_array($upload_data)){
            $url_face = SITE_URL."uploads/{$upload_data['file_name']}";
        } else {
            $url_face = $upload_data;
        }

        if($face){
            $targetFace = $face;
        } else {
            $targetFace = $this->lib_recognition->detect($url_face);
        }

        if(isset($targetFace->error)){
            $output['status'] = 'erro';
            $output['msg'] = 'Não conseguimos reconhecer seu rosto';
            unlink($upload_data['full_path']);
        } else {
            if(count($targetFace) == 1){
                if(!isset($userdata)){
                    $verify = $this->lib_recognition->verifyPerson($targetFace[0]->faceId, $participante->personId, PERSONGROUP);
                    if(isset($verify->error)){
                        if($verify->error->code == 'PersistedFaceNotFound'){
                            $output = $this->novaFoto($url_face, $targetFace[0], $participante, $train, $atual);
                        } else {
                            $output['status'] = 'erro';
                            $output['msg'] = $verify->error->message;
                        }
                    } else {
                        if($verify->isIdentical){
                            $output = $this->novaFoto($url_face, $targetFace[0], $participante, $train, $atual);
                        } else {
                            $verifySameFace = $this->lib_recognition->identifyPerson($targetFace[0]->faceId, PERSONGROUP);
                            if(isset($verifySameFace[0]->candidates[0]->personId)){
                                $output['status'] = 'erro';
                                $output['msg'] = 'Essa foto não se parece com você';
                            } else {
                                $output = $this->novaFoto($url_face, $targetFace[0], $participante, $train, $atual);
                            }
                        }
                    }
                } else {
                    $output = $this->novaFoto($url_face, $targetFace[0], $participante, $train, $atual);
                }
            } else {
                $output['status'] = 'erro';
                $output['msg'] = 'Não é permitido mais de 1 pessoa na foto';
            }
        }
        return $output;
    }
    
    public function novaFoto($url_face, $face, $participante, $train, $atual=0) 
    {
        $dadosTargetFace = $face->faceRectangle->left.",";
        $dadosTargetFace.= $face->faceRectangle->top.",";
        $dadosTargetFace.= $face->faceRectangle->width.",";
        $dadosTargetFace.= $face->faceRectangle->height;

        $response = $this->lib_recognition->addPersonFace($url_face, PERSONGROUP, $participante->personId, $dadosTargetFace);
        if(isset($response->persistedFaceId)){
            $save_data = array(
                'participante_id' => $participante->participante_id,
                'persistedFaceId' => $response->persistedFaceId,
                'foto' => $url_face
            );
            $this->save($save_data);
            if($train){
                $this->lib_recognition->train(PERSONGROUP);
            }
            $output = array(
                'status' => 'sucesso',
                'msg' => 'Foto adicionada com sucesso' 
            );
        } else {
            $output = array(
                'status' => 'erro',
                'msg' => $response->error->message
            );
        }
        return $output;
    }

}
