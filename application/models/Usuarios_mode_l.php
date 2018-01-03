<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usuarios_model extends My_Model
{
    var $id_col = 'usuario_id';
    var $fields = array(   
            'nome' => array(
                'type' => 'text',
                'label' => 'Nome',
                'class' => '',
                'rules' => 'required',
                'label_class' => 'col-md-2',
                'prepend' => '<div class="col-md-3">',
                'append' => '</div>',
                ),

            'email' => array(
                'type' => 'text',
                'label' => 'Email',
                'class' => '',
                'rules' => 'required|callback_uniqemail',
                'label_class' => 'col-md-2',
                'prepend' => '<div class="col-md-3">',
                'append' => '</div>',
                ),
            'senha' => array(
                    'type' => 'password',
                    'label' => 'Senha',
                    'class' => '',
                    'rules' => '',
                    'label_class' => 'col-md-2',
                    'prepend' => '<div class="col-md-3">',
                    'append' => '</div>',
                    ),
            'usuarios_tipo_id' => array(
                    'type' => 'select',
                    'label' => 'Tipo de Usuário',
                    'class' => '',
                    'rules' => 'required',
                    'label_class' => 'col-md-2',
                    'prepend' => '<div class="col-md-3">',
                    'append' => '</div>',
                    'values' => array(),
                    'from' => array('model' => 'usuarios_tipo', 'value' => 'tipo'),
                    ),

            );

    public function _filter_pre_save(&$data) 
    {
        if(isset($data['senha']))
            $data['senha'] = password_hash($data['senha'], PASSWORD_DEFAULT);
    }
    public function login() 
    {
        $where['email'] = $this->input->post('email');
        $usuario = $this->get_where($where)->row();

        if($usuario){
            $this->session->set_userdata('admin', $usuario);
            if(password_verify($this->input->post('senha'), $usuario->senha)){
                $this->session->set_userdata('admin', $usuario);
                return true;
            } else {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }
}
