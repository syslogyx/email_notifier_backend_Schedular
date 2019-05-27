<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\MachineLevels;

class CreateMachineEmailLevelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('machine_email_levels', function (Blueprint $table) {
            $table->increments('id');
            $table->string('level_no');
            $table->string('time_in_minute');
            $table->timestamps();
        });

        $data = array(
            array(
                "level_no" => "1",
                "time_in_minute" => "15"
            ),
            array(
                "level_no" => "2",
                "time_in_minute" => "30"
            ),
            array(
                "level_no" => "3",
                "time_in_minute" => "45"
            ),
            array(
                "level_no" => "4",
                "time_in_minute" => "60"
            )
        );

        MachineLevels::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('machine_email_levels');
    }
}
