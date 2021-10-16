<?php

# membuat class Animal
class Animal
{
  # property animals
  private $data = array();

  # method constructor - mengisi data awal
  # parameter: data hewan (array)
  public function __construct($data)
  {
    $this->data = $data;
  }

  # method index - menampilkan data animals
  public function index()
  {
    # gunakan foreach untuk menampilkan data animals (array)
    $no = 1;
    foreach ($this->data as $value) {
      echo $no++ . ". " . $value . "<br>";
    }
  }

  # method store - menambahkan hewan baru
  # parameter: hewan baru
  public function store($data)
  {
    array_push($this->data, $data);
    # gunakan method array_push untuk menambahkan data baru
  }

  # method update - mengupdate hewan
  # parameter: index dan hewan baru
  public function update($index, $data)
  {
    $replacements = array($index => $data);
    $this->data = array_replace($this->data, $replacements);
  }

  # method delete - menghapus hewan
  # parameter: index
  public function destroy($index)
  {
    unset($this->data[$index]);
    # gunakan method unset atau array_splice untuk menghapus data array
  }
}

# membuat object
# kirimkan data hewan (array) ke constructor
$animal = new Animal(["Monkey", "Panda", "Spider", "Elephant", "Ferret"]);

echo "Index - Menampilkan seluruh hewan <br>";
$animal->index();
echo "<br>";

echo "Store - Menambahkan hewan baru <br>";
$animal->store('burung');
$animal->index();
echo "<br>";

echo "Update - Mengupdate hewan <br>";
$animal->update(0, 'Kucing Anggora');
$animal->index();
echo "<br>";

echo "Destroy - Menghapus hewan <br>";
$animal->destroy(1);
$animal->index();
echo "<br>";
