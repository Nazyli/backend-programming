<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AnimalController extends Controller
{
    //
    private $data;

    public function __construct()
    {
        $this->data = array(1 => "Monkey", 2 => "Panda", 3 => "Spider", 4 => "Elephant", 5 => "Ferret");
    }

    function index()
    {
        return collect($this->data);
    }

    function getById($id)
    {
        return $this->data[$id];
    }


    function create(Request $request)
    {
        $nama = $request->nama;
        array_push($this->data, $nama);
        return $this->data;
    }

    function update(Request $request, $id)
    {
        $nama = $request->nama;
        $replacements = array($id => $nama);
        $this->data = array_replace($this->data, $replacements);
        return $this->data;
    }

    function destroy($id)
    {
        unset($this->data[$id]);
        return $this->data;
    }

    public function getData()
    {
        return $this->data;
    }

    /**
     * Set the value of data
     *
     * @return  self
     */
    public function setData($data)
    {
        $this->data = $data;

        return $this;
    }
}
