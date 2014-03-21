<?php

class admin_CategoryController extends \BaseController {
	protected $layout = 'layouts.admin';

	public function index($id = null)
	{
		if (isset($id)){
			$category = Category::find($id);
			if ($category) {
				return View::make('admin/category', array('category'=>$category));
			}else{
				App::abort(500, 'Error fetching category.');
			}
		}else{
			$categories = Category::all();
			return View::make('admin/categories', array('categories'=>$categories));
		}
	}

	public function create()
	{

		$category = new Category;
		return View::make('admin/category', array('category'=>$category));
	}

    public function make()
    {
        $input      = Input::all();
        $survey_id  = $input['survey_id'];
        $survey     = Survey::find($survey_id);
        $query      = Category::where('name', $input['name']);

        if($query->count() < 1){
            $category = Category::create($input);
            if($category) $survey->categories()->attach($category->id);
            return $category;
        }

        return 'false';
    }

	public function save($id = null)
	{
		if (isset($id)){
			$category = Category::find($id);
			if ($category) {
				$category->fill(Input::all());
				$category->save();
				return Redirect::to('admin/categories');
			}else{
				App::abort(500, 'Error fetching category.');
			}
		}else{
			$category = new Category;
			$category->fill(Input::all());
			$category->save();
			return Redirect::to('admin/categories');
		}
	}

	public function delete($id)
	{
		$category = Category::find($id);
		if ($category) {
			$category->delete();
			return Redirect::to('admin/categories');
		}else{
			App::abort(500, 'Error fetching category.');
		}
	}

    public function attatch($survey_id)
    {
        #Need to pull the categories from a join table here
        $cat_ids    = Input::get('data');
        $survey     = Survey::find($survey_id);

        $categories = array();
        foreach($cat_ids as $id):
            $survey->categories()->attach($id);
            $category       = Category::find($id);
            $category       = $category->toArray();
            $categories[]   = $category;
        endforeach;

        return json_encode($categories);
    }
}