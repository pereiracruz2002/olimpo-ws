<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Relatorios_model extends MY_Model {
    
    protected $all_checkins;
            
    function __construct() {
        parent::__construct();
        $this->load->model("Checkins_model", "checkins");
    }
    
    public function checkins ()
    {
        $this->get_checkins();
        $checkins_order = array();
        foreach ($this->all_checkins as $checkin) {
            $checkins_order[$checkin->participante_id]["nome"] = $checkin->nome;
            $checkins_order[$checkin->participante_id]["terminal"][$checkin->terminal_id]["terminal"] = $checkin->terminal;
            $checkins_order[$checkin->participante_id]["terminal"][$checkin->terminal_id]["checkin"][$checkin->checkin_id] = $checkin->data;
        }
        return $checkins_order;
    }
    
    protected function get_checkins ()
    {
        $this->db->order_by('participantes.nome', 'ASC');
        $this->db->select("checkins.*, participantes.nome, terminais.terminal")
                ->join("participantes", "checkins.participante_id=participantes.participante_id")
                ->join("terminais", "checkins.terminal_id=terminais.terminal_id");
        
        $this->all_checkins = $this->checkins->get_where(array())->result();
    }
    
}