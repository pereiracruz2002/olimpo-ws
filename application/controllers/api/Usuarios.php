<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usuarios extends CI_Controller
{

    public function __construct() 
    {
        parent::__construct();
        $this->output->set_header("access-control-allow-origin: *");

    }

     public function all() 
    {
        $this->load->model('usuarios_model','usuarios');
        $usuarios = $this->usuarios->get_all()->result();
        $this->output->set_content_type('application/json')
                     ->set_output(json_encode($usuarios));
    }

}
