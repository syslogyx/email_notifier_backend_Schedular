<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class SchedularSendMailToMachine extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'mail_send:machine';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send an email of level wise registered email address to check OFF machines status. ';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
       app('App\Http\Controllers\MailSentController')->mailSendSchedular();

       $this->info('Schedular run successfully!');
    }
}
