<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Mail;
use Bogardo\Mailgun\MailgunServiceProvider;
use DB;
use App\MailSentAssoc;
use App\MachineLevels;
use App\Machine;
use App\User;
use App\Status_Reason;

class MailSentController extends Controller
{
    public function mailSendSchedular(){
    	$totalLevelCount = MachineLevels::count();
    	// $mailSentIDsRecord = MailSentAssoc::distinct('machine_id')->pluck('machine_id');
    	$mailSentIDsRecord =MailSentAssoc::select([DB::RAW('DISTINCT(machine_id)')])->get();
    	
    	foreach ($mailSentIDsRecord as $key) {
    		$machineLastRecord = MailSentAssoc::where('machine_id',$key['machine_id'])->orderBy('updated_at','asc')->get()->last();

    		if($machineLastRecord['status'] == 'OFF'){
    			$currentLevel = MachineLevels::where('id',$machineLastRecord['machine_level_id'])->first();
    			if((int)$currentLevel['level_no'] <= $totalLevelCount){

    				$from_time = strtotime($machineLastRecord['on_time']);
					$to_time = strtotime(date('Y-m-d H:i:s'));
					$timeDiff = round(abs($to_time - $from_time) / 60,2);
					
					if($timeDiff > (int)$currentLevel['time_in_minute']){
						$machine = Machine::where('id',$machineLastRecord['machine_id'])->first();

	                    $assignUserEmail = User:: where('id',$machine->user_id)->pluck('email')->first();

	                    $statusReason = Status_Reason::where('id',$machineLastRecord['port_status_reason_id'])->pluck('reason')->first();

	                    $levelColumName = 'level_'.$currentLevel['level_no'].'_email_ids';
	 
	                    $data = [];
	                    $data['machine_id'] = $machineLastRecord['machine_id'];
	                    $data['machine_name'] = $machine['name'];
	                    $data['email_ids'] = $machine[$levelColumName].','.$assignUserEmail;
	                    $data['reason'] = $statusReason;
	                    $data['status'] = 'OFF';

	                    if((int)$currentLevel['level_no'] < $totalLevelCount){
	                    	$this->sendMailToUsers($data);
	                    	$nextLevel = (int)$currentLevel['level_no']+1;

	                    	$nextLevelID = MachineLevels::where('level_no',$nextLevel)->pluck('id')->first();

	                    	// update level
	                    	MailSentAssoc::where('id',$machineLastRecord['id'])->update(['machine_level_id' => $nextLevelID]);
	                    }else if((int)$currentLevel['level_no'] == $totalLevelCount){
	                    	if($machineLastRecord['last_record_mail_sent_flag'] == 0){
	                    		$this->sendMailToUsers($data);
	                    		MailSentAssoc::where('id',$machineLastRecord['id'])->update(['last_record_mail_sent_flag' => 1]);
	                    	}
	                    }
					}	
    			}
    		}
    	}

    	return response()->json(['status_code' => 200, 'message' => 'Mail Sent Successfully!']);
    }

    function sendMailToUsers($model) {
	    config(['mail.username' => 'admsyslogyx@gmail.com',
	              'mail.password' => 'ealert123#']);
	      
	    $email = explode(',', $model['email_ids']);
	     
	    $subjectMsg = 'Machine('.$model['machine_name'].') - Schedular Status';

	    Mail::send('email.email_template', $model, function($message) use ($email,$subjectMsg) {        
	          $message->to($email);
	          $message->subject($subjectMsg);
	    });

	    if (count(Mail::failures()) > 0) {
	        $errors = 'Failed to send email, please try again.';
	        return $errors;
	    }
	}
}
