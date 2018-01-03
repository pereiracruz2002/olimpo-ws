<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Participantes_model extends MY_Model {
    var $id_col = 'participante_id';
    var $fields = array(
        'nome' => array(
            'type' => 'text',
            'label' => 'Nome',
            'class' => '',
            'rules' => 'required',
            'label_class' => 'col-md-2',
            'prepend' => '<div class="col-md-3">',
            'append' => '</div>',
            'extra' => array(
                'maxlength' => '25'
            )
        ),
        /*
        'cargo' => array(
            'type' => 'text',
            'label' => 'Cargo',
            'class' => '',
            'rules' => '',
            'label_class' => 'col-md-2',
            'prepend' => '<div class="col-md-3">',
            'append' => '</div>',
            'extra' => array(
                'maxlength' => '25'
            )
        ),
        'email' => array(
            'type' => 'text',
            'label' => 'Email',
            'class' => '',
            'rules' => '',
            'label_class' => 'col-md-2',
            'prepend' => '<div class="col-md-3">',
            'append' => '</div>',
            ),
        'tipo_documento_id' => array(
            'type' => 'select',
            'label' => 'Tipo documento',
            'class' => '',
            'rules' => '',
            'label_class' => 'col-md-2',
            'prepend' => '<div class="col-md-3">',
            'append' => '</div>',
            'values' => array(),
            'from' => array(
                'model' => "tipos_documentos", 
                'value' => 'tipo'
                )
            ),
        'num_doc' => array(
            'type' => 'text',
            'label' => 'Nº documento',
            'class' => '',
            'rules' => '',
            'label_class' => 'col-md-2',
            'prepend' => '<div class="col-md-3">',
            'append' => '</div>',
            ),
        'telefone' => array(
            'type' => 'text',
            'label' => 'Telefone',
            'class' => '',
            'rules' => '',
            'label_class' => 'col-md-2',
            'prepend' => '<div class="col-md-3">',
            'append' => '</div>',
        )
         */
    );

    public function _filter_pre_save(&$data) 
    {
        if(!$data['tipo_documento_id']){
            unset($data['tipo_documento_id']);
        }
    }
}
