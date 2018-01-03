<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Terminais_model extends MY_Model
{
    var $id_col = 'terminal_id';
    var $fields = array(   
        'terminal' => array(
            'type' => 'text',
            'label' => 'Descrição',
            'class' => '',
            'rules' => 'required',
            'label_class' => 'col-md-2',
            'prepend' => '<div class="col-md-3">',
            'append' => '</div>',
        ),
    );

}
