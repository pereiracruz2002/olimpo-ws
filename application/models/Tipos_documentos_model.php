<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Tipos_documentos_model extends MY_Model
{
    var $id_col = 'tipo_documento_id';
    var $fields = array(   
        'tipo' => array(
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