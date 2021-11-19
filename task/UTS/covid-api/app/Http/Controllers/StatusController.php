<?php

namespace App\Http\Controllers;

use App\Models\Status;
use Illuminate\Http\Request;

class StatusController extends Controller
{
    //

    public function index()
    {
        $statuses = Status::all();
        $data = [
            "message" => "Status all",
            "data" => $statuses
        ];
        return response()->json($data, 200);
    }
}
