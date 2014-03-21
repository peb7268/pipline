<?php

class admin_UsersController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
        return View::make('admin.users', ['users' => User::paginate(25)]);
	}

    public function search(){
        $query  = Input::get('query');
        $survey = Input::get('survey');

        if((! isset($survey)) && $survey !== "0" ){
            die('here');
            $users = User::where('email', 'like', '%'.$query.'%')
                     ->orWhere('unique_param', 'like', '%'.$query.'%')
                     ->paginate(25);
        } else {

            $users = DB::table('users')
                    ->where('survey_id', $survey)
                    ->where(function($q) use ($query)
                    {
                        $q->where('unique_param', 'like', '%'.$query.'%');
                    })
                    ->paginate(25);

        }

        //return Redirect::to('admin/users')->with('users', $users);
        return View::make('admin.users', ['users' => $users]);
    }

    public function add(){
        return View::make('admin.userAdd');
    }

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        $input = Input::all();
        $input['password'] = Hash::make($input['password']);
        $user  = User::create($input);

        $message = 'user created successfully';
        return Redirect::to('admin/users')->with('flash_message', $message);
	}


    public function delete(){
        //TODO: extract checked
        $users  = $this->buildUsers(Input::all());
        $users  = $this->filterByChecked($users);

        foreach($users as $filtered_user){
            $user   = User::find($filtered_user['user_id']);
            $user->delete();
        }

        $message = 'user(s) successfully deleted';
        return Redirect::to('admin/users')->with('flash_message', $message);
    }

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update()
	{
        $input = Input::all();
        $users = $this->buildUsers($input);
        $users = $this->filterByChecked($users);

        foreach($users as $user){
            $usr = User::find($user['user_id']);
            dd($input);
            $usr->fill($user);
            $usr->save();
        }

        $message = 'user(s) updated successfully';
        return Redirect::to('admin/users')->with('flash_message', $message);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

    public function filterByChecked($users){
        $filtered_users = array();

        foreach($users as $user){
            if(array_key_exists('select', $user)) {
                array_push($filtered_users, $user);
            }
        }

        return $filtered_users;
    }

    public function buildUsers($input){
        $user = array();

        //Loop throught the input
        foreach($input as $key => $value){
            if(gettype($value) == 'array'){
                foreach($value as $idx => $row_item){
                    $user[$idx][$key] = $row_item;
                }
            }
        }
        return $user;
    }

}