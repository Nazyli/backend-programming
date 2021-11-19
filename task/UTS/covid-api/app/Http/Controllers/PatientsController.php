<?php

namespace App\Http\Controllers;

use App\Models\Patients;
use App\Models\Status;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Validator;

class PatientsController extends Controller
{
    //

    public function index()
    {
        $patients = Patients::all();
        $patients = $this->toPatients($patients);

        if (sizeof($patients)) {
            $data = ["message" => "Get all patients", "total" => sizeof($patients), "data" => $patients];
        } else {
            $data = ["message" => "Data is empty", "data" => $patients];
        }
        return response()->json($data, 200);
    }

    public function show($id)
    {
        $patient = Patients::find($id);
        if ($patient) {
            $data = [
                "message" => "Get detail patient",
                "data" => $this->copyPropsPatient($patient)
            ];
            return response()->json($data, 200);
        } else {
            $data = [
                "message" => "error",
                "info" => 'Patients not found'
            ];
            return response()->json($data, 404);
        }
    }

    public function store(Request $request)
    {
        if (!$request->all()) {
            $data = ["message" => "error", "info" => 'No Content'];
            return response()->json($data, 204);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'status_id' => 'required|numeric',
            'in_date_at' => 'date|required',
            'out_date_at' => 'date'
        ]);

        if ($validator->fails()) {
            return response()->json(["message" => "error", "info" => $validator->errors()->getMessages()], 400);
        }
        if (!Status::find($request->status_id)) {
            return response()->json(["message" => "error", "info" => "Status with id " . $request->status_id . " not found"], 404);
        }
        $patients = Patients::create($validator->validate());
        $patients = $this->copyPropsPatient($patients);

        $data = ["message" => "Patients is is added successfully", "data" => $patients];
        return response()->json($data, 201);
    }

    public function update(Request $request, $id)
    {
        if (!$request->all()) {
            $data = ["message" => "error", "info" => 'No Content'];
            return response()->json($data, 204);
        }
        $name = $request->name;
        $phone = $request->phone;
        $address = $request->address;
        $status_id = $request->status_id;
        $in_date_at = $request->in_date_at;
        $out_date_at = $request->out_date_at;

        $patient = Patients::find($id);
        if ($patient) {
            $patient->update([
                "name" => $name != null ? $name : $patient->name,
                "phone" => $phone != null ? $phone : $patient->phone,
                "address" => $address != null ? $address : $patient->address,
                "status_id" => $status_id != null ? $status_id : $patient->status_id,
                "in_date_at" => $in_date_at != null ? $in_date_at : $patient->in_date_at,
                "out_date_at" => $out_date_at != null ? $out_date_at : $patient->out_date_at,
            ]);
            $data = [
                "message" => "Patients is update successfully",
                "data" => $this->copyPropsPatient($patient)
            ];
            return response()->json($data, 200);
        } else {
            $data = [
                "message" => "error",
                "info" => 'Patients not found'
            ];
            return response()->json($data, 404);
        }
    }

    public function destroy($id)
    {
        $patients = Patients::find($id);
        if ($patients) {
            $patients->delete();
            $data = [
                "message" => "Patients is delete successfully",
                "data" => $patients
            ];
            return response()->json($data, 200);
        } else {
            return response()->json(["message" => "error", "info" => "Patients not found"], 404);
        }
    }

    public function searchByName($name)
    {
        $patients = Patients::where('name', 'like', '%' . $name . '%')->get();
        $patients = $this->toPatients($patients);
        if (sizeof($patients)) {
            $data = ["message" => "Get searched patients", "total" => sizeof($patients), "data" => $patients];
        } else {
            $data = ["message" => "Data is empty", "data" => $patients];
        }
        return response()->json($data, 200);
    }



    public function statusPositive()
    {
        return $this->findByStatus(1);
    }

    public function statusRecovered()
    {
        return $this->findByStatus(2);
    }

    public function statusDead()
    {
        return $this->findByStatus(3);
    }

    private function findByStatus($statusId)
    {
        $status = Status::find($statusId);

        if (!$status) {
            return response()->json(["message" => "error", "info" => "Status with id " . $statusId . " not found"], 404);
        }

        $patients = Patients::where('status_id', $statusId)->get();
        $patients = $this->toPatients($patients);
        $data = ["message" => "Get " . strtolower($status->name) . " resource", "total" => sizeof($patients), "data" => $patients];
        return response()->json($data, 200);
    }

    private function toPatients($patients)
    {
        return $patients->map(function ($patient) {
            return $this->copyPropsPatient($patient);
        });
    }

    private function copyPropsPatient($patients)
    {
        return [
            'id' => $patients->id,
            'name' => $patients->name,
            'phone' => $patients->phone,
            'address' => $patients->address,
            'status' => ucwords(strtolower($patients->status->name)),
            'in_date_at' => $patients->in_date_at,
            'out_date_at' => $patients->out_date_at
        ];
    }
}
