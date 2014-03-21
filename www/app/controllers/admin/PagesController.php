<?php

class admin_PagesController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		dd('index');
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create($id)
	{
		$survey = Survey::find($id);
		$page = new Page();
		return View::make('admin.page', compact('survey', 'page'));
	}

	public function post_create($survey_id, $page_id = null){ //why named post_create??
		$survey = Survey::find($survey_id);
		$input 	= Input::all();
		$submessage = '';

		if(isset($page_id)){
			$page = Page::find($page_id);
			$page->fill($input);

			if ($page->type == 'optional')
			{
				$pageOrder = json_decode($survey->page_order, TRUE);
				if (array_search($page->name, $pageOrder) !== FALSE)
				{
					$pageOrder = array_diff(array_values($pageOrder), array($page->name));
					$survey->page_order = json_encode($pageOrder);
					$survey->save();
					$submessage = " Page order changed.";
				}
			}
			elseif ($page->type == 'default')
			{
				$pageOrder = json_decode($survey->page_order, TRUE);
				if (array_search($page->name, $pageOrder) === FALSE)
				{
					array_push($pageOrder, $page->name);
					$survey->page_order = json_encode($pageOrder);
					$survey->save();
					$submessage = " Page order changed.";
				}
			}

		} else {
			$page 	= new Page();
			$page->survey_id = $survey_id;
			$page->name = $input['name'];
			$page->hash = $input['hash'];
			$page->type = $input['type'];

			if ($page->type == 'default')
			{
				$pageOrder = json_decode($survey->page_order, TRUE);
				array_push($pageOrder, $page->name);
				$survey->page_order = json_encode($pageOrder);
				$survey->save();
				$submessage = " Page add to end of order.";
			}

			$template 	= $input['template'];
			$page->template  = View::make('front_templates.default')->with(compact('template'))->render();
 		}
		$page->save();
		$message = 'Successfully updated a page.';

		$dirty = self::_validate_pageorder($survey);
		if ($dirty)
		{
			$submessage .= ' Change detected when validating page order.';
		}

		return Redirect::to('admin/surveys/' . $survey_id . '/pages/'. $page->id)->with('flash_message', $message . $submessage);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		dd('store');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($survey_id, $page_id)
	{

		$page 	= Page::find($page_id);
		$survey = $page->Survey;
		return View::make('admin.page', compact('page', 'survey'));
	}

	/**
	 * Sets up the pages order page
	 * @param int $survey_id
	 * @return view
	 **/
	public function order($survey_id)
	{
		$survey = Survey::find($survey_id);
		return View::make('admin.pages', compact('survey'));
	}

	/**
	 * Saves a new page order to a survey object
	 * @param array Input - contains survey id and page order
	 *
	 **/
	public function order_save()
	{
		$survey = Survey::find(Input::get('survey_id'));
		$survey->page_order = Input::get('page_order');
		$survey->save();
		$message = 'Order successfully updated.';

		return Redirect::to('admin/surveys/' . $survey->id)->with('flash_message', $message);
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

	public function destroy($survey_id, $page_id)
	{
		$page = Page::where('id', $page_id)->where('survey_id', $survey_id)->first();
		$survey = Survey::find($survey_id);

		if ($page && $survey)
		{
			Page::destroy($page_id);
			//TODO (DELETE ALL PAGES WITH THAT NAME (OTHER LANGS))

			$dirty = self::_validate_pageorder($survey);

			$message = 'Successfully deleted page "'.$page->name . '".';
			if ($dirty)
			{
				$message .= ' The page order changed...Verify survey.';
			}

			return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
		}
		else
		{
			return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', 'Error deleteing page.');
		}
	}

	private function _validate_pageorder($survey)
	{
		//check page order.
		$page_order = json_decode($survey->page_order, TRUE);
		if (empty($page_order)){$page_order = array();}

		$dirty = false;

		foreach ($page_order as $page_name)
		{
			$this_page = Page::where('survey_id', $survey->id)->where('name', $page_name)->where('type', 'default')->first();
			if (! empty($this_page))
			{
				$new_order[] = $page_name;
			}else{
				$dirty = true;
			}
		}

		if ($dirty)
		{
			$survey->page_order = json_encode($new_order);
			$survey->save();
		}

		return $dirty;
	}

    public function duplicate($survey_id, $page_id)
    {
        $page     = Page::find($page_id);
        $newP     = new Page;
        $attrs    = $page->getAttributes();
        unset($attrs['id']);
        $newP->fill($attrs);
        $newP->survey_id = $page->survey_id;

        if($newP->save()) return $newP;
        return 0;
    }
}