<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class SiswaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('id_ID');
        $gender = $faker->randomElement(['L', 'P']);
        $religion = $faker->randomElement(['Kristen', 'Islam', 'Budha']);

        for ($i=0; $i < 20; $i++) { 
          DB::table('siswa')->insert([
            'nama_depan'     => $faker->firstName,
            'nama_belakang'  => $faker->lastName,
            'jenis_kelamin'  => $gender,
            'agama'          => $religion,
            'alamat'         => $faker->address
          ]);
        }
    }
}