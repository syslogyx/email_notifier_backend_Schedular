<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class MailSentAssoc extends Model
{
   protected $table = 'mail_sent_assoc';
	protected $guarded = ['id','created_at', 'updated_at'];
	private $rules = array(
	    'machine_id' => 'required',
	    'status' => 'required',
	    'on_time' => 'required',
	    'machine_level_id' => 'required',
	    'port_status_reason_id' => 'nullable',
	    'last_record_mail_sent_flag' => 'nullable'
	);

	private $errors;

	public function validate($data) {
	    $validator = Validator::make($data, $this->rules);
	    if ($validator->fails()) {
	        $this->errors = $validator->errors();
	        return false;
	    }
	    return true;
	}
}
