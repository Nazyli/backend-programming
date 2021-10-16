<?php

class Person {

    private $nama;
    private $alamat;
    private $jurusan;


    function __construct($nama, $alamat, $jurusan)
    {
        $this->nama = $nama;
        $this->alamat = $alamat;
        $this->jurusan = $jurusan;
    }

    public function getNama()
    {
        return $this->nama;
    }

    public function setNama($nama)
    {
        $this->nama = $nama;

        return $this;
    }


    public function getAlamat()
    {
        return $this->alamat;
    }


    public function setAlamat($alamat)
    {
        $this->alamat = $alamat;

        return $this;
    }

    public function getJurusan()
    {
        return $this->jurusan;
    }


    public function setJurusan($jurusan)
    {
        $this->jurusan = $jurusan;

        return $this;
    }
}

$evry = new Person("Evry Nazyli Ciptanto", "Magetan", "Informatika");
 
echo $evry->getNama();
echo "<br>";
 
echo $evry->getAlamat();
echo "<br>";
 
echo $evry->getjurusan();
echo "<br>";