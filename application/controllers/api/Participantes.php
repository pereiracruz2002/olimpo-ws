<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Participantes extends CI_Controller 
{

    var $personGroupId = PERSONGROUP;


    function __construct () 

    {
        parent::__construct();
        $this->load->library('lib_recognition');
        $this->output->set_header("access-control-allow-origin: *");
        $this->load->model('participantes_model','participanes');
    }
    
    public function cadastro ()
    {
        $this->load->model("participantes_model", "participante");
        $output = array();
        
        $post = $this->input->post('form');
        
        if ($this->encryption->decrypt($this->input->post('token'))) {
            $id_participante = $this->participante->save($post);
            $output = array(
                'status' => 'ok',
                'participante_id' => $id_participante
            );
        } else {
            $output = array(
                'status' => 'erro',
                'msg' => "você não tem permissão"
            );
        }
        
        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));
    }
    
    public function check_email ()
    {
        $this->load->model("participantes_model", "participante");
        $output = array();
        $where = array('email' => $this->input->post('email'), 'ativo' => '1');
        $participante = $this->participante->get_where($where)->row();
        
        if ($this->encryption->decrypt($this->input->post('token'))) {
            $output = array(
                'status' => 'ok',
                'participante' => $participante
            );
        } else {
            $output = array(
                'status' => 'erro',
                'msg' => "você não tem permissão"
            );
        }
        
        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));
    }
    
    public function tipodocumento () 
    {
        $this->load->model("tipos_documentos_model", "tipos_documentos");
        $output = array();
        
        $tipos_documentos = $this->tipos_documentos->get_where(array())->result_array();
        if ($this->encryption->decrypt($this->input->post('token'))) {
            $output = array(
                'status' => 'ok',
                'tipos_documentos' => $tipos_documentos
            );
        } else {
            $output = array(
                'status' => 'erro',
                'msg' => "você não tem permissão"
            );
        }
        
        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));
    }


     public function criarGrupo()
    {
        $output = $this->lib_recognition->createPersonGroup(PERSONGROUP,strtoupper(PERSONGROUP));
        $this->output->set_content_type('application/json')
                     ->set_output(json_encode($output));
    }


    public function listaGrupo()
    {
        $output = $this->lib_recognition->getPersonGroup($personGroupId);
        $this->output->set_content_type('application/json')
                     ->set_output(json_encode($output));
    }


    public function gravaCheckin()
    {
        $this->load->model('checkins_model','checkins');
        $terminal_id = $this->input->post('terminal_id');
    }


     public function loginData() 
    {
        
        if(!is_dir(UPLOAD_DIR)){
            mkdir(UPLOAD_DIR);
            file_put_contents(UPLOAD_DIR.'/index.html', 'Directory access is forbidden.');
        }
        $uploadpath = UPLOAD_DIR;
        
        $this->load->helper('file');
        $filename = uniqid(date('YmdHis')).'.jpg';

        $base64_img = str_replace('data:image/1;base64,', '', $this->input->post('img'));

        if(!file_exists(FCPATH.'uploads/'.$filename) and file_put_contents($uploadpath.$filename, base64_decode($base64_img))){
            $config['image_library'] = 'gd2';
            $config['source_image'] = $uploadpath.$filename;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = 640;
            $config['height'] = 640;
            $config['master_dim'] = 'width';
            $config['quality'] = '100%';

            $this->load->library('image_lib', $config);
            $this->image_lib->resize();

            $this->loginFace(array('img' => SITE_URL.'uploads/'.$filename),$this->input->post('terminal'));
        } else {
            $this->output->set_content_type('application/json')
                ->set_output(json_encode(array('status' => -2, 'msg' => 'Upload Duplicado')));
        }

    }


    public function loginFace($upload=false, $terminais)
    {
        $this->load->model('participantes_model','participantes');
        $this->load->model('checkins_model','checkin');
        
        if(!$upload){
            $upload = $this->upload();
        }
        if(isset($upload['erro'])){
            $output = array('status' => 0, 'msg' => 'Problema no upload', 'error' => $upload['erro']);
        } else {

            $url = $upload['img'];
            
            $targetFace = $this->lib_recognition->detect($url);
            
            if(!$targetFace or isset($targetFace->error)){
                $output = array('status' => -1, 'msg' => 'Nenhum rosto dectectado', 'error' => $targetFace->error, 'img' => $url);
            } else {

                $faceId = $targetFace[0]->faceId;
                $verifySameFace = $this->lib_recognition->identifyPerson($faceId, PERSONGROUP);
                
                if((isset($verifySameFace->error)) or !$verifySameFace){
                    if($verifySameFace->error->code == 'PersonGroupNotTrained'){
                        $this->lib_recognition->train($this->personGroupId);
                    }
                    $output = array('status' => 2, 'msg' => 'Não reconhecemos você como participante desse evento.', 'error' => $verifySameFace);
                } else {
                    $participante = false;



                    if($verifySameFace){
                        if(isset($verifySameFace[0]->candidates[0]->personId)){
                            $where = array(
                                'personId' => $verifySameFace[0]->candidates[0]->personId
                            );
                            $participante = $this->participantes->get_where($where)->row();
                        }
                    } 

                    if($participante){
                        $where = array(
                                'checkins.participante_id' => $participante->participante_id,
                                'checkins.terminal_id'=>$terminais
                            );

                        $this->db->select('count(*) as total');
                        $checkin = $this->checkin->get_where($where)->row();

                        if($checkin->total > 0){
                            $output = array('status' => 2, 'msg' => $participante->nome.', você já marcou esse terminal.', 'error' => $verifySameFace);
                        }else{
                            $save_data = array(
                                'participante_id' => $participante->participante_id,
                                'terminal_id' =>$terminais,
                                'data' => date('Y-m-d H:i:s'),
                            );
                            $checkin_id = $this->checkin->save($save_data);

                            $output = array(
                                'checkin_id' => $checkin_id,
                                'status' => 1, 
                                'nome' => $participante->nome, 
                                'img' => $url,
                                'msg' => 'Confirmar registro de '. $participante->nome . '?'
                            );
                        }
                    } else {
                        $output = array('status' => 0, 'msg' => 'Seu cadastro não foi reconhecido.', 'error' => $verifySameFace);
                    }
                }
            }
        }
        
        $this->output->set_content_type('application/json')
                     ->set_output(json_encode($output));
    }




    public function upload() 
    {
        
        if(!is_dir(UPLOAD_DIR)){
            mkdir(UPLOAD_DIR);
            write_file(UPLOAD_DIR.'/index.html', 'Directory access is forbidden.');
        }

        $uploadpath = UPLOAD_DIR."/";

        $config['upload_path'] = $uploadpath;
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['encrypt_name'] = true;
        $this->load->library('upload', $config, 'lib_upload');

        if (!$this->lib_upload->do_upload('arquivo')){
            return array('erro' => $this->lib_upload->display_errors());
        } else {
            $this->upload_data = $this->lib_upload->data();
            return array('img' => SITE_URL.'uploads/'.$this->upload_data['file_name']);
        }
    }

    /*
        1 = 10%; col-md-1
        2 = 50%;  - col-md-6
        3 = 33,33% - col-md-3
        4 = 30% - col-md-4
        5 = 20% - col-md-5
        7 = 14.28% - col-md-7
        8  =12.5%   -col-md-8
        9 = 11.11%  -col-md-9
        11 = 9.0909 -col-md-11
        12 = 100% - col-md-12

        total =13;

    */

    public function listAllParticipantes()
    {

        $this->load->model("participantes_model", "participante");

        $this->db->select('participantes_fotos.foto, 
                           participantes.participante_id as participante_id, 
                           participantes.nome
                           ')
                  ->join('participantes_fotos','participantes_fotos.participante_id =participantes.participante_id')
                  //->join('checkins','checkins.participante_id = participantes.participante_id')
                  ->where('`participantes`.`participante_id` NOT IN (SELECT `vencedores`.`participante_id` FROM `vencedores`)', NULL, FALSE)
                  ->where('participantes.personId IS NOT NULL', NULL, false);
         $this->db->order_by('rand()');

        
        $result = $this->participante->get_all()->result();
        $output = array();
        foreach ($result as $item) {
            $item->nome  = ucwords(strtolower($item->nome));
            $output[] = $item;
            
        }
        
        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));

    }


    public function listOneParticipantes()
    {
        $this->load->model("participantes_model", "participante");

        $this->db->select('participantes_fotos.foto, participantes.participante_id,participantes.nome')
                  ->join('participantes_fotos','participantes_fotos.participante_id =participantes.participante_id')
                  ->where('`participantes`.`participante_id` NOT IN (SELECT `vencedores`.`participante_id` FROM `vencedores`)', NULL, FALSE);
        $this->db->order_by('rand()');
        $this->db->limit(1, 0);


        
        $output = $this->participante->get_all()->result();
        
        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));
    }

    public function listWithoutWinners(){
        $where = array('vencedor_id' => NULL);
        $this->load->model("participantes_model", "participante");
        
        $this->db->select('participantes_fotos.foto, vencedor_id')
                 ->join('participantes_fotos','participantes_fotos.participante_id =participantes.participante_id')
                 ->join('vencedores','vencedores.participante_id=participantes.participante_id','left');

        $output = $this->participante->get_where($where)->result();

        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));
    }

    public function listWinners(){
        $this->load->model("participantes_model", "participante");
        
        $this->db->select('participantes.*, participantes_fotos.foto, vencedor_id')
                 ->join('participantes_fotos','participantes_fotos.participante_id =participantes.participante_id')
                 ->join('vencedores','vencedores.participante_id=participantes.participante_id');

        $output = $this->participante->get_all()->result();

        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));

    }

    public function gravaVencedor(){
        $vencedorId = $this->input->post('vencedorId');
        $data = array(
            'participante_id'=>$vencedorId,
            'data'=>date('Y-m-d')
        );
        $output = array();
        if($this->db->insert('vencedores',$data))
            $output['msg'] = "sucess";
        else
            $output['msg'] = "error";

        $this->output->set_content_type('application/json')
                ->set_output(json_encode($output));
    }

    public function cancelCheckin() 
    {
        $this->load->model('checkins_model','checkins');
        $this->checkins->delete($this->input->post('checkin_id'));
        $this->output->set_content_type('application/json')
                     ->set_output(json_encode(array('status' => 1)));
    }

}
