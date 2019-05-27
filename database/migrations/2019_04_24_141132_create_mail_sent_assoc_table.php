<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMailSentAssocTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mail_sent_assoc', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('machine_id')->nullable()->unsigned();
            $table->foreign('machine_id')->references('id')->on('machines');
            $table->string('status')->nullable();
            $table->timestamp('on_time')->nullable();
            $table->integer('machine_level_id')->nullable()->unsigned();
            $table->foreign('machine_level_id')->references('id')->on('machine_email_levels');
            $table->integer('port_status_reason_id')->nullable()->unsigned();
            $table->foreign('port_status_reason_id')->references('id')->on('status__reasons');
            $table->boolean('last_record_mail_sent_flag');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mail_sent_assoc');
    }
}
