<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller kategori
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
class kategori extends RestController
{
    
  public function __construct()
  {
    parent::__construct();
    // $this->load->model('kategori_Model','kategoris');
    $this->load->model('kategori_model');
  }

  public function index_get()
  {
    $kategoris = $this->kategori_model->get();
    $this->response(['status'=>true,'data'=> $kategoris],RestController::HTTP_OK);
  }

}


/* End of file Kriteria.php */
/* Location: ./application/controllers/Kriteria.php */