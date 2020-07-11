<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Index extends CI_Controller {


	function __construct(){
		parent::__construct();
	}

	public function index()
	{
		if($_POST){
			$login=$this->db->get_where("murid",array("id_murid"=>$_POST["id_murid"],"password_murid"=>$_POST["password"]));
			if ($login->num_rows()>0){
				$row=$login->row();
				$this->session->set_userdata("login_murid",true);
				$this->session->set_userdata($row);
				redirect (base_url());
			}
			else { 
				redirect (base_url());
			}
		}else{
			$this->load->view('user/v_index');
		}
	}

	public function logout(){
		$this->session->sess_destroy();
		redirect (base_url());
	}

	function ticket (){
		if(isset($_GET['kelas']) && !empty($_GET)){
			$this->db->select('forum.*, guru.nama as namaguru, diskusi.diskusi as diskusi, diskusi.id_diskusi');
			$this->db->join('guru','forum.id_guru=guru.id_guru');
			$this->db->join('diskusi','diskusi.id_forum=forum.id_forum','left');
			$data ['row']=$this->db->get_where('forum',array('kelas'=>$_GET['kelas']));
			$this->load->view('user/ticket_kelas',$data);	
		} elseif(isset($_GET['ticket'])){
			$this->db->select('forum.*, guru.nama as namaguru, diskusi.diskusi as diskusi, diskusi.id_diskusi');
			$this->db->join('guru','forum.id_guru=guru.id_guru');
			$this->db->join('diskusi','diskusi.id_forum=forum.id_forum','left');
			$this->db->where('judul like "%'.$_GET['ticket'].'%"');
			$data ['row']=$this->db->get('forum');
			$this->load->view('user/ticket_kelas',$data);	
		} else {
			$this->db->select('forum.*,count(kelas) as kls');
			$this->db->group_by('kelas');
			$data ['row']=$this->db->get('forum');
			$this->load->view('user/ticket',$data);	
		}
	}

	public function about()
	{
		$this->load->view('user/about');	
	}

	public function info()
	{
		$data ['row']=$this->db->get('info');
		$this->load->view('user/info',$data);	
	}
}