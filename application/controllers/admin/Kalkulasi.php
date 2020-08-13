<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include('Super.php');

class Kalkulasi extends Super
{
    
    function __construct()
    {
        parent::__construct();
        $this->language       = 'english'; /** Indonesian / english **/
        $this->tema           = "flexigrid"; /** datatables / flexigrid **/
        $this->tabel          = "kalkulasi";
        $this->active_id_menu = "kalkulasi";
        $this->nama_view      = "kalkulasi";
        $this->status         = true; 
        $this->field_tambah   = array(); 
        $this->field_edit     = array(); 
        $this->field_tampil   = array(); 
        $this->folder_upload  = 'assets/uploads/files';
        $this->add            = true;
        $this->edit           = true;
        $this->delete         = false;
        $this->crud;
    }

    function index(){
            $data = [];
            if($this->crud->getState()=="add")
                redirect(base_url('admin/Kalkulasi/addKalkulasi'));
            if($this->crud->getState()=="edit"){
                $id = $this->uri->segment(5);
                redirect(base_url('admin/Kalkulasi/editKalkulasi/'.$id));
            }
            /** Bagian GROCERY CRUD USER**/


            /** Relasi Antar Tabel 
            * @parameter (nama_field_ditabel_ini, tabel_relasi, field_dari_tabel_relasinya)
            **/
            // $this->crud->set_relation('parent_menu','tjm_menu','nama_menu');

            /** Upload **/
            // $this->crud->set_field_upload('nama_field_upload',$this->folder_upload);  
            
            /** Ubah Nama yang akan ditampilkan**/
            // $this->crud->display_as('nama','Nama Setelah di Edit')
            //     ->display_as('email','Email Setelah di Edit'); 
            
            /** Akhir Bagian GROCERY CRUD Edit Oleh User**/
            $data = array_merge($data,$this->generateBreadcumbs());
            $data = array_merge($data,$this->generateData());
            $this->generate();
            $data['output'] = $this->crud->render();
            $this->load->view('admin/'.$this->session->userdata('theme').'/v_index',$data);
    }

    private function generateBreadcumbs(){
        $data['breadcumbs'] = array(
                array(
                    'nama'=>'Dashboard',
                    'icon'=>'fa fa-dashboard',
                    'url'=>'admin/dashboard'
                ),
                array(
                    'nama'=>'Admin',
                    'icon'=>'fa fa-users',
                    'url'=>'admin/useradmin'
                ),
            );
        return $data;
    }

    public function addKalkulasi(){

        $data = [];
        $data = array_merge($data,$this->generateBreadcumbs());
        $data = array_merge($data,$this->generateData());
        $this->generate();

        $data['page'] = "add-kalkulasi";
        $data['output'] = $this->crud->render();
        $this->load->view('admin/'.$this->session->userdata('theme').'/v_index',$data);
    }

    public function insertKalkulasi(){
        $judul = $this->input->post('judul');
        $tanggal = $this->input->post('tanggal');
        $periode_awal = $this->input->post('periode_awal');
        $periode_akhir = $this->input->post('periode_akhir');
         
        //convert
        $timeStart = strtotime($periode_awal);
        $timeEnd = strtotime($periode_akhir);
         
        // Menambah bulan ini + semua bulan pada tahun sebelumnya
        $numBulan = 1 + (date("Y",$timeEnd)-date("Y",$timeStart))*12;
         
        // hitung selisih bulan
        $numBulan += date("m",$timeEnd)-date("m",$timeStart);
         
        if($numBulan != 6){
            redirect(base_url('admin/Kalkulasi/addKalkulasi/'));
        }

        // $this->db->where("DATE_FORMAT(periode_awal,'%Y-%m')", $periode_awal);
        $this->db->where('periode_awal',$periode_awal);
        $this->db->where('periode_akhir',$periode_akhir);
        $getKalkulasi = $this->db->get('kalkulasi')->num_rows();

        if($getKalkulasi >0){
            redirect(base_url('admin/Kalkulasi/addKalkulasi'));
        }
        
        $this->db->set('judul',$judul);
        $this->db->set('tanggal_kalkulasi',$tanggal);
        $this->db->set('periode_awal',$periode_awal);
        $this->db->set('periode_akhir',$periode_akhir);
        $this->db->set('status','Belum diproses');
        $this->db->insert('kalkulasi');

        redirect(base_url('admin/Kalkulasi'));
    }

    public function editKalkulasi($id){

        $data = [];
        $data = array_merge($data,$this->generateBreadcumbs());
        $data = array_merge($data,$this->generateData());
        $this->generate();

        $data['periode'] = $this->db->get_where('kalkulasi',array('id'=>$id))->row();

        $data['page'] = "edit-kalkulasi";
        $data['output'] = $this->crud->render();
        $this->load->view('admin/'.$this->session->userdata('theme').'/v_index',$data);
    }
}