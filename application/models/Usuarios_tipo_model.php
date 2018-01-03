<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usuarios_tipo_model extends My_Model
{
    var $id_col = 'usuarios_tipo_id';
    var $fields = array(   
            'tipo' => array(
                'type' => 'text',
                'label' => 'Nome',
                'class' => '',
                'rules' => 'required',
                'label_class' => 'col-md-2',
                'prepend' => '<div class="col-md-3">',
                'append' => '</div>',
                ),
            );
}
