<p align="center" style="display: inline;"><a href="https://codeigniter.com/" target="_blank"><img src="https://belajarphp.net/wp-content/uploads/2019/03/logo-codeigniter.png" width="200"></a></p>

# Resep

> URL: /Resep
1. Menerima request GET untuk menampilkan resep
```
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
      ...
```
2. Menerima request POST mengirim data kuliner
```
public function index_post()
  {
    $data = [
      'nama_kuliner' => $this->post('nama_kuliner', true),
      'asal' => $this->post('asal',true),
      'kategori' => $this->post('kategori',true),
      'gambar' => $this->post('gambar',true),
      'durasi' => $this->post('durasi',true),
      'porsi' => $this->post('porsi',true),
      'bahan' => $this-
      ...
```
3. Menerima request PUT mengubah data kuliner yang sudah ada
```
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
      ...
```
4. Menerima request DELETE menghapus data pada database
```
public function index_delete()
  {
    $id = $this->delete('id');
    $delete = $this->resep_model->delete($id);
    if ($delete['status']) {
      # code...
      $status = (int)$delete['data'
      ...
```

1. Membuat request HTTP GET, POST, PUT, DELETE pada tabel resep
2. Menerapkan keamanan berupa XSS Clean (terhadap inputan script), mengaktifkan API KEY, Membatasi akses pada tabel


## Databse config
1. Database pada projek ini bernama kuliner
