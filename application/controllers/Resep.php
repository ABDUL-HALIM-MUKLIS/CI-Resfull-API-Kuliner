<?php
defined('BASEPATH') or exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');

// Don't forget include/define REST_Controller path

/**
 *
 * Controller Resep
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller REST
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */
use chriskacerguis\RestServer\RestController;

class Resep extends RestController
{
    
  public function __construct()
  {
    parent::__construct();
    $this->load->model('resep_model');
    $this->methods['index_get']['limit'] = 1000;
  }

  public function index_get()
  {
    $asal = $this->get('asal');
    $id = $this->get('id');
    $p = $this->get('page');
    if ($asal === null || $id === null) {
      # code...
      $p = (empty($p) ? 1 : $p);
      $total_data = $this->resep_model->count();
      $total_page = ceil($total_data / 5 );
      $start = ($p - 1) * 5;

      $reseps = $this->resep_model->getdata($asal,$id, 5, $start);

      if($reseps) {
        $data = [
          'status'=>true,
          'page' => $p,
          'total_data' => $total_data,
          'total_page' => $total_page,
          'data'=> $reseps,
        ];
      }else {
        $data = [
          'status'=>false,
          'msg' => 'Data tidak ditemukan',
        ];
      }

      $this->response($data,RestController::HTTP_OK);
    }else {
      # code...
      // print($asal);
      $start = ($p - 1) * 5;
      $data = $this->resep_model->getdata($asal,$id, 5,$start);
      if ($data) {
        # code...
        $this->response(['status'=>true,'data'=> $data],RestController::HTTP_OK);
      }else {
        # code...
        $this->response(['status'=>false,'msg'=> 'tidak ditemukan'],RestController::HTTP_NOT_FOUND);
      }
    }
  }

  public function index_post()
  {
    $data = [
      'nama_kuliner' => $this->post('nama_kuliner', true),
      'asal' => $this->post('asal',true),
      'kategori' => $this->post('kategori',true),
      'gambar' => $this->post('gambar',true),
      'durasi' => $this->post('durasi',true),
      'porsi' => $this->post('porsi',true),
      'bahan' => $this->post('bahan',true),
      'resep' => $this->post('resep',true),
    ];
    $simpan= $this->resep_model->add($data);
    if ($simpan['status']) {
      # code...
        $this->response(['status' =>true, 'msg' =>$simpan['data']. ' Data telah ditambahkan'], RestController::HTTP_CREATED);
    }else {
      $this->response(['status' => false, 'msg' => $simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
    }
  }

  public function index_put()
  {
    $data = [
      'nama_kuliner' => $this->put('nama_kuliner',true),
      'asal' => $this->put('asal',true),
      'kategori' => $this->put('kategori',true),
      'gambar' => $this->put('gambar',true),
      'durasi' => $this->put('durasi',true),
      'porsi' => $this->put('porsi',true),
      'bahan' => $this->put('bahan',true),
      'resep' => $this->put('resep',true),
    ];
    $id = $this->put('id',true);
    $simpan = $this->resep_model->update($id, $data);
    if ($simpan['status']) {
      # code...
      $status = (int)$simpan['data'];
      if ($status>0) {
        # code...

        $this->response(['status' =>true, 'msg' =>$simpan['data']. ' Data tekah dirubah'], RestController::HTTP_OK);
      }else {
        # code...
        $this->response(['status' =>true, 'msg' =>$simpan['data']. ' Tidak ada data yang diubah'], RestController::HTTP_BAD_REQUEST);
      }
    }else {
      $this->response(['status' => false, 'msg' => $simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
    }
  }

  public function index_delete()
  {
    $id = $this->delete('id');
    $delete = $this->resep_model->delete($id);
    if ($delete['status']) {
      # code...
      $status = (int)$delete['data'];
      if ($status>0) {
        # code...
        $this->response(['status' =>true, 'msg' =>'Data dengan id '.$id. ' Data tekah dihapus'], RestController::HTTP_OK);
      }else {
        # code...
        $this->response(['status' =>true, 'msg' =>$id. ' Tidak ada data yang dihapus','data'=>$delete], RestController::HTTP_BAD_REQUEST);
      }
    }else {
      $this->response(['status' => false, 'msg' => $delete['msg']], RestController::HTTP_INTERNAL_ERROR);
    }
  }

}


/* End of file Resep.php */
/* Location: ./application/controllers/Resep.php */