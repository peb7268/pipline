<?php

class TodosController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Todo::all();
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		dd('create');
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
        $input  = Input::all();
        $todo   = Todo::create($input);
        return $todo;
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
        dd('edit');
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
        dd('update');
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$todo = Todo::destroy($id);
        return "Item $id has been destroyed.";
	}

    //API Endpoints
    public function fetchTodosByYMD($uid, $y, $m, $d)
    {
        $numArgs = func_num_args();

        switch($numArgs){
            case 1:
                $todos = $this->fetchTodosForUser($uid);
            break;
            case 2:
                $todos = $this->fetchTodosForUserByYear($uid, $y);
            break;
            case 2:
                $todos = $this->fetchTodosForUserByYearByMo($uid, $y, $m);
            break;
            case 4:
                $todos = $this->fetchTodosForUserByYearByMoByDay($uid, $y, $m, $d);
            break;
        }

        return $todos;
    }

    public function fetchTodosForUserByYearByMoByDay($uid, $y, $m, $d)
    {
        $todos = Todo::where(function($query) use($uid, $y, $m, $d){
            $y = (integer) $y;
            $m = (integer) $m;
            $d = (integer) $d;

            $query->where('user_id', $uid)
                  ->where('year', $y)
                  ->where('month', $m)
                  ->where('day', $d)

                  ->orWhere('user_id', $uid)
                  ->where('status', 0)
                  ->where('roll_over', 1)
                  ->where('year', '<=', $y)
                  ->where('month', '<=', $m)
                  ->where('day', '<=', $d);
        })->get();

        return $todos;
    }
}
