<?php

namespace Database\Seeders;

use App\Models\Patients;
use App\Models\Status;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class SampelDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        //php artisan db:seed --class=SampelDataSeeder
        DB::transaction(function () {
            User::create([
                "name" => 'admin test',
                "email" => 'admin@gmail.com',
                "password" => Hash::make('admin'),
            ]);

            Status::insert([
                ['id' => '1', 'name' => 'POSITIVE'],
                ['2', 'RECOVERED'],
                ['3', 'DEAD']
            ]);

            Patients::factory()->count(30)->create();
        });
    }
}
