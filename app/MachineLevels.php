<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;


class MachineLevels extends Model
{
    protected $table = 'machine_email_levels';
	protected $guarded = ['id','created_at', 'updated_at'];
	private $rules = array(
	    'level_no' => 'required',
	    'time_in_minute' => 'required'
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
