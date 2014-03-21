<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {
	protected $fillable = array('survey_id', 'selectedConcepts', 'id', 'password',
                                'first_name', 'last_name', 'email', 'termniated',
                                'completed', 'haveBought', 'agreed', 'unique_param',
                                'user_type', 'user_role');

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password');

	protected function getIdAttribute($value){
		return (int)$value;
	}
	protected function getAgreedAttribute($value){
		return (int) $value;
	}
	protected function getSurveyIdAttribute($value){
		return (int)$value;
	}

	public function investments(){
		return $this->hasMany('Investment', 'user_id');
	}

	public function survey_investments(){
		$investments =  DB::table('investments')->join('concepts', function($join)
        {
            $join->on('investments.concept_id', '=', 'concepts.id')
            ->on('concepts.survey_id', '=', DB::raw($this->survey_id));
        })
        ->where('investments.user_id', $this->id)
        ->select(array('investments.*'))
        ->get();

        //integer conversions
        foreach ($investments as $i=>$investment){
        	$investments[$i]->id = (int)$investment->id;
        	$investments[$i]->concept_id = (int)$investment->concept_id;
        	$investments[$i]->user_id = (int)$investment->user_id;
        	$investments[$i]->is_best = (int)$investment->is_best;
        	$investments[$i]->is_worst = (int)$investment->is_worst;
        }

        return $investments;
	}

	/**
	 * Get the unique identifier for the user.
	 *
	 * @return mixed
	 */
	public function getAuthIdentifier()
	{
		$key = $this->getKey();
		return $key;
	}

	/**
	 * Get the password for the user.
	 *
	 * @return string
	 */
	public function getAuthPassword()
	{
		$password = $this->password;
		return $password;
	}

	/**
	 * Get the e-mail address where password reminders are sent.
	 *
	 * @return string
	 */
	public function getReminderEmail()
	{
		return $this->email;
	}

	public static function lookupIdByEmail($email){
		$user = User::where('email', $email)->get()->first();
		if(gettype($user) == "NULL") return false;
		$id =  $user->id;
		return $id;
	}

    /*
    * Intelligently tries to look up a user from one of three sources, otherwise makes a new user.
    * @return User $object
    */
    public static function instance($survey, $input = null, $unique_id = null){
        if($survey->quotaMet($survey)) return false;
        #If the unique id is recorded from the initial login request and it matches the session unique id
       // $unique_id = ($unique_id !== null) ? $unique_id : Session::get('unique_id');
        //$suid = Session::get('unique_id');

        /*
         * If the current query string unique_id matches session unique_id for the id generated in the init call
         * then retrieve the currently requested user.
        */
//        if($unique_id === $suid){
//            $uid   = Session::get('user_id');
//            if(isset($uid)){
//                $user  = User::find($uid);
//                if(isset($user->id) && $user->unique_param == $unique_id) return $user;
//            }
//        }

        #if you are passed a user from input as in the second call to the LoginController then use that user.
        if(array_key_exists('params', $input)){
            $params = $input['params'];
            if(array_key_exists('user', $params)) {
            $user = User::find($input['user']);
            return $user;
        }
        }

        #Find the user by unique_id on the query string if present
        if(! isset($user)) $user = User::findUserByUniqueId($survey, $unique_id);
        if(isset($user->id)) return $user;

        #Otherwise generate a new user
        return self::make($survey->id);
    }

    public static function make($survey_id){
        Session::flush();
        $input  = Input::all();
        $user   = new User;
        $survey = Survey::find($survey_id);

        $user->survey_id    = $survey->id;
        $user->unique_param = $input['params']['unique_id'];

        $other_params = array();
        $params = json_decode($survey->other_params);
        if (count($params) > 0)
        {
            foreach (json_decode($params) as $param)
            {
                $other_params[$param] = Input::get($param);
            }
        }

        $user->other_params = json_encode($other_params);
        $user->save();
        Session::put('user_id', $user->id);
        return $user;
    }

    public static function findUserByUniqueId($survey, $unique_id){
        if(strpos($unique_id, '#') > 0){
            $unique_id = explode('#', $unique_id);
            $unique_id = $unique_id[0];
        }

        $usr_obj = DB::table('users')->where('survey_id', $survey->id)
                                ->where('unique_param', $unique_id)->first();

        if(isset($usr_obj)) {
            $user = User::find($usr_obj->id);
            return $user;
        }
        return false;
    }

    public static function completes($survey_id){
        $completes = DB::table('users')->where(function($query) use ($survey_id){
            $query->where('survey_id', $survey_id)
                  ->where('completed', '1');
        })->count();
        return $completes;
    }
}