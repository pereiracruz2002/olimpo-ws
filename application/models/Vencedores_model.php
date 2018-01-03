<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Vencedores_model extends My_Model
{
    var $id_col = 'vencedor_id';
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
       );

}
