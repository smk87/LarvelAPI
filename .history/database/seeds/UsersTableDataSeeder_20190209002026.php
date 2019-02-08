<?php

use Illuminate\Database\Seeder;
use App\User;

class UsersTableDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 3; $i++) {
            User::create([
                'name' => str_random(8),
                'email' => str_random(12) . '@mail.com',
                'password' => bcrypt('123456')
            ]);

            Films::create([
                'name' => str_random(8),
                'description' => str_random(12) . '@mail.com',
                'release' => str_random(date()),
                'rating' => random_int(1, 5),
                'ticket_price' => 500,
                'country' => str_random(5),
                'genre' => '{"genre":"test"}',
                'photo' => str_random(15)
            ]);
        }
    }
}