<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use \Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    //

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(["message" => "error", "info" => $validator->errors()->getMessages()], 400);
        }

        $user = User::create([
            "name" => $request->name,
            "email" => $request->email,
            "password" => Hash::make($request->password),
        ]);

        return response()->json(["message" => "Register user successfuly added!", "data" => $user], 201);
    }

    public function login(Request $request)
    {
        if (!$request->all()) {
            return response()->json(["message" => "error", "info" => 'No Content'], 204);
        }
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(["message" => "error", "info" => $validator->errors()->getMessages()], 400);
        }

        if (Auth::attempt($validator->validate())) {
            $token = Auth::user()->createToken('auth_token');
            return response()->json(["message" => "Login successfuly!", "token" => $token->plainTextToken], 200);
        }
        return response()->json(["message" => "Login is invalid!", "info" => "Unauthorized"], 401);
    }
}

