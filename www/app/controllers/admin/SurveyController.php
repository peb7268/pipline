<?php

class admin_SurveyController extends \BaseController {
	protected $layout = 'layouts.admin';

	public function index($id = null){
		if (isset($id)){
			$survey = Survey::find($id);
			if ($survey) {
				return self::_survey_form($survey);
			}else{
				App::abort(500, 'Error fetching survey.');
			}
		}else{
			$surveys = Survey::all();
			return View::make('admin/surveys', compact('surveys'));
		}
	}

    public function create(){
		$survey = new Survey;
		$survey->required_categories = '[]';
		return self::_survey_form($survey);
	}

	private function _survey_form($survey){
        $categories = $survey->categories()->get();
        $categories = $categories->lists('name', 'id');

		$displayed_categories 	= json_decode($survey->displayed_categories, TRUE);
		if (empty($displayed_categories)){$displayed_categories = array();}

		$required_categories 	= json_decode($survey->required_categories, TRUE);
		if (empty($required_categories)){$required_categories = array();}

		$acceptable_categories 	= json_decode($survey->acceptable_categories, TRUE);
		if (empty($acceptable_categories)){$acceptable_categories = array();}

		$survey->other_params = json_decode($survey->other_params);
        $survey->hashed_survey_id = "http://market" . surveySetup::domainEncode($survey->id);
        $survey->url = SurveyHelper::nomalizeSurveyUrl($survey);
		$concepts 	 = $survey->concepts;
		$questions 	 = $survey->questions;
		$pages 		 = $survey->pages;

		return View::make('admin/survey', array(
			'survey'				=>$survey,
			'categories'			=>$categories,
			'displayed_categories'	=>$displayed_categories,
			'required_categories'	=>$required_categories,
			'acceptable_categories'	=>$acceptable_categories,
			'concepts'				=>$concepts,
			'questions'				=>$questions,
			'pages'					=> $pages
			)
		);
	}

    /** When you push save in the survey create admin **/
	public function save($id = null){
		$input = Input::all();
		$image = Input::file('image');
		//dd($image);
		if($image){
			$background_image = IMG_PATH.$image->getClientOriginalName();
			$image->move(public_path().'/img', $image->getClientOriginalName());
		}
		if (!isset($input['displayed_categories'])){
			$input['displayed_categories'] = array();
		}
		$input['displayed_categories']  = self::_encodeCategories($input['displayed_categories']);

		if (!isset($input['required_categories'])){
			$input['required_categories'] = array();
		}
		$input['required_categories']  = self::_encodeCategories($input['required_categories']);

		if (!isset($input['acceptable_categories'])){
			$input['acceptable_categories'] = array();
		}
		$input['acceptable_categories']  = self::_encodeCategories($input['acceptable_categories']);

		if (isset($id)){
			if (!isset($input['other_params'])){
				$input['other_params'] = '';
			}
			$other_params = array();
			foreach (explode(',', $input['other_params']) as $param) {
				if (trim($param)!=''){
					$other_params[] = trim($param);
				}
			}

			$input['other_params']  = json_encode($other_params);

			$survey = Survey::find($id);
			if ($survey) {
				$survey->fill($input);
				$survey->background_image = (isset($background_image)) ? $background_image : '';
				$survey->save();
				return Redirect::to('admin/surveys/' . $survey->id);
			}else{
				App::abort(500, 'Error fetching survey.');
			}
		}else{
			$survey = SurveyFactory::make(null, $input);
			return Redirect::to('admin/surveys/' . $survey->id);
		}
	}

    private function _encodeCategories($categories){
		if (! isset($categories)){
			$categories = array();
		}
		foreach ($categories as $i=>$category)
		{
			$categories[$i] = (int)$category;
		}
		$categories = json_encode($categories);
		return $categories;
	}

    public function delete($id){
		$survey = Survey::find($id);
		if ($survey) {
			$survey->delete();
			return Redirect::to('admin/surveys');
		}else{
			App::abort(500, 'Error fetching survey.');
		}
	}

    public function duplicate($survey_id){
		$survey = SurveyFactory::make($survey_id);
        return $survey;
		//return Redirect::to('admin/surveys')->with('flash_message', "Survey $survey_id duplicated.");
	}

	public function export_investments($survey_id){
		$message = "Exported survey investments for $survey_id.";
		$export_destination = storage_path() . '/surveys/' . $survey_id;

		$survey = Survey::find($survey_id);
		$investments_records = Investment::leftJoin('users', function($join) use ($survey_id)
        {
            $join->on('users.id', '=', 'investments.user_id');
        })
        ->leftJoin('concepts', function($join) use ($survey_id)
        {
            $join->on('investments.concept_id', '=', 'concepts.id')
            ->on('concepts.survey_id', '=', DB::raw($survey_id));
        })
        ->where('users.survey_id', $survey_id)
        ->where('number_of_shares', '>', 0)
        ->get(array('investments.*', 'users.id as user_id', 'users.unique_param as uservar', 'concepts.name as concept'));

        //dd($investments);

        $headers = array(
        	'Concept Name',
        	'User ID',
        	'# of Shares',
        	'Total Price',
        	'Date/Time (GMT)'
        );
        $headers = array($headers); //convert to multi for export purpose.

        foreach($investments_records as $investments_record)
        {
        	$row = array();
        	$row[] = $investments_record->concept;
        	$row[] = $investments_record->uservar;
        	$row[] = $investments_record->number_of_shares;
        	$total = $investments_record->number_of_shares * $investments_record->price_of_purchase;
        	$row[] = number_format((float)$total, 2, '.', '');
        	$row[] = $investments_record->created_at;
        	$investments[] = $row;
        }

		if (! is_dir($export_destination))
		{
			mkdir($export_destination);
		}
		chdir($export_destination);

		$dataSet = array($headers,$investments);

		$name 	= "Survey-{$survey_id}_Investments_" . Date('Y_m_d_s');
		$fp 	= fopen($name.'.csv', 'w');
		foreach($dataSet as $group){
			foreach($group as $line){
				fputcsv($fp, $line);
			}
		}
		fclose($fp);

		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: private",false);
		header("Content-Type: application/octet-stream");

		header("Content-Disposition: attachment; filename=\"$name.csv\";" );
		header("Content-Transfer-Encoding: binary");

		$output = '';

		foreach($dataSet as $group){
			foreach($group as $line){
				$output .= implode(',', $line);
				$output .=  "\n";
			}
		}

		return $output; //overrides layout

		//return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
	}

	public function export_questions($survey_id){
		$survey = Survey::find($survey_id);

		if (empty($survey))
		{
			$message = "No data to export.";
			return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
		}

		$other_params = json_decode($survey->other_params, TRUE);
		// $category_ids = json_decode($survey->displayed_categories, TRUE);
		// $categories = Category::whereIn('id', $category_ids)->get();
		// dd($categories->lists('name'));

		$users = User::where('survey_id', $survey->id)->where('completed', 1)->get();
		$concepts = $survey->concepts;

		if (empty($users) || empty($concepts))
		{
			$message = "No user or concept data to export.";
			return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
		}



        $headers = array(
        	'User ID',
        	'Unique Param'
        );

        //add in other params.
        $headers = array_merge($headers, $other_params);

        // //add in categories.
        // $headers += $categories->lists('name');

        //add in concepts.
        $headers = array_merge($headers,$concepts->lists('name'));

        $headers[] = 'Best Concept';

        //add best concept questions
    	$questions = new Question;
        $questions = $questions->fetch_by_category( $survey->id, 'best_concept');
        foreach ($questions as $question)
        {
        	//todo more escaping?
        	$headers[] = '"' . str_replace('"', '""', $question->description) . '"';
        }

        $headers[] = 'Worst Concept';

        //add worst concept questions
    	$questions = new Question;
        $questions = $questions->fetch_by_category( $survey->id, 'worst_concept');
        foreach ($questions as $question)
        {
        	//todo more escaping?
        	$headers[] = '"' . str_replace('"', '""', $question->description) . '"';
        }

        //add demographic questions
    	$questions = new Question;
        $questions = $questions->fetch_by_category( $survey->id, 'demographics');
        foreach ($questions as $question)
        {
        	//todo more escaping?
        	$headers[] = '"' . str_replace('"', '""', $question->description) . '"';
        }

        //add in remaining questions headers.
        $questions = new Question;
        $questions = $questions->fetch_uncategorized($survey->id);
        foreach ($questions as $question)
        {
        	//todo more escaping?
        	$headers[] = '"[' . $question->category . '] ' . str_replace('"', '""', $question->description) . '"';
        }


        $headers = array($headers); //convert to multi for export purpose.

        $rows = array();
        foreach($users as $user)
        {
        	$row = array();
        	$row[] = $user->id;
        	$row[] = $user->unique_param;

        	//add in other params.
        	$row += json_decode($user->other_params, TRUE);

        	//add in investments
        	$investments = $user->survey_investments($survey->id);

        	foreach($concepts as $concept)
        	{
        		$found = false;

        		foreach($investments as $investment)
        		{
        			if ($investment->concept_id == $concept->id)
        			{
        				$found = true;
        				$total = $investment->number_of_shares * $investment->price_of_purchase;
        				$row[] = number_format((float)$total, 2, '.', '');

        				if ($investment->is_best == 1)
        				{
        					$best = $concept->name;
        				}
        				elseif ($investment->is_worst == 1)
        				{
        					$worst = $concept->name;
        				}
        			}
        		}

	    		if (!$found)
    			{
    				$row[] = '-';
    			}
        	}

        	//add best concept
        	$row[] = $best;


        	//add best concept questions
        	$questions = new Question;
            $questions = $questions->fetch_by_category( $survey->id, 'best_concept', $user->id);

            foreach ($questions as $question)
	        {
	        	//todo more escaping?
	        	$row[] = '"' . str_replace('"', '""', $question->response_text) . '"';
	        }

        	//add worst concept
        	$row[] = $worst;

        	//add worst concept questions
        	$questions = new Question;
            $questions = $questions->fetch_by_category( $survey->id, 'worst_concept', $user->id);
            foreach ($questions as $question)
	        {
	        	//todo more escaping?
	        	$row[] = '"' . str_replace('"', '""', $question->response_text) . '"';
	        }

	        //add demographic questions
        	$questions = new Question;
            $questions = $questions->fetch_by_category( $survey->id, 'demographics', $user->id);
            foreach ($questions as $question)
	        {
	        	//todo more escaping?
	        	$row[] = '"' . str_replace('"', '""', $question->response_text) . '"';
	        }

	        //add in remaining answers
	        //add in remaining questions headers.
        	$questions = new Question;
        	$questions = $questions->fetch_uncategorized($survey->id, $user->id);
	        foreach ($questions as $question)
	        {
	        	//todo more escaping?
	        	$row[] = '"' . str_replace('"', '""', $question->response_text) . '"';
	        }

	        $rows[] = $row;
        }

		$dataSet = array($headers,$rows);

		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: private",false);
		header("Content-Type: application/octet-stream");
		$name 	= "Survey-{$survey_id}_Questions_" . Date('Y_m_d_s');

		header("Content-Disposition: attachment; filename=\"$name.csv\";" );
		header("Content-Transfer-Encoding: binary");

		$output = '';

		foreach($dataSet as $group){
			foreach($group as $line){
				$output .= implode(',', $line);
				$output .=  "\n";
			}
		}

		return $output; //overrides layout
	}

	public function export_suggestions($survey_id){
		$survey = Survey::find($survey_id);

		if (empty($survey))
		{
			$message = "No data to export.";
			return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
		}

		$suggestions =  Suggestion::join('concepts', function($join)
        {
            $join->on('suggestions.concept_id', '=', 'concepts.id');
        })
        ->join('users', function($join)
        {
            $join->on('suggestions.user_id', '=', 'users.id');
        })
        ->where('users.survey_id', $survey_id)
        ->select(array('suggestions.*', 'concepts.name', 'users.unique_param'))
        ->get();

		if (empty($suggestions))
		{
			$message = "No suggestion data to export.";
			return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
		}

//dd($suggestions);

        $headers = array(
        	'Concept',
        	'User Unique Parameter',
        	'Suggestion',
        	'Thumbs Up',
        	'Thumbs Down',
        	'Net Votes',
        	'Timestamp'
        );
        $headers = array($headers);

        $rows = array();

        foreach ($suggestions as $suggestion)
        {
        	$row = array();
        	$row[] = '"' . str_replace('"', '""', $suggestion->name) . '"';
        	$row[] = '"' . str_replace('"', '""', $suggestion->unique_param) . '"';
			$row[] = '"' . str_replace('"', '""', $suggestion->description) . '"';
			$votes = $suggestion->suggestionVotes;

			$up = $down = 0;
			foreach ($votes as $vote)
			{
				if ((Int)$vote->up_or_down === 1)
				{
					++$up;
				}
				elseif((Int)$vote->up_or_down === 0)
				{
					++$down;
				}
			}
			$row[] = $up;
			$row[] = $down;
			$row[] = $up - $down;
			$row[] = $suggestion->created_at;
			$rows[] = $row;
        }

		$dataSet = array($headers,$rows);

		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: private",false);
		header("Content-Type: application/octet-stream");
		$name 	= "Survey-{$survey_id}_Suggestions_" . Date('Y_m_d_s');

		header("Content-Disposition: attachment; filename=\"$name.csv\";" );
		header("Content-Transfer-Encoding: binary");

		$output = '';

		foreach($dataSet as $group){
			foreach($group as $line){
				$output .= implode(',', $line);
				$output .=  "\n";
			}
		}

		return $output; //overrides layout
	}

	public function export($survey_id){
		$message = "exporting survey $survey_id";
		$export_destination = 'surveys';

		$survey 	= Survey::find($survey_id);
		$questions 	= Question::where('survey_id', $survey_id)->get();
		$pages 		= Page::where('survey_id', $survey_id)->get();
		$answers 	= Answer::where('survey_id', $survey_id)->get();

		#Prep for output
		$spacer 	  		= array();
		$survey_array 		= $survey->toArray();
		$survey_keys  		= array_keys($survey_array);
		$survey_array 		= array_values($survey_array);

		$question_array 	= $questions->toArray();
		$question_keys 		= array_keys($question_array);
		$question_array 	= array_flatten(array_values($question_array));

		$answer_array 		= $answers->toArray();
		$answer_keys 		= array_keys($answer_array);
		$answer_array 		= array_flatten(array_values($answer_array));

		$page_array 		= $pages->toArray();
		$page_keys 			= array_keys($page_array);
		$page_array			= array_values($page_array);
		$page_array         = array_flatten($page_array);

		$dir = scandir(storage_path());
		foreach($dir as $directory){
			/**
			 * 1) See if the surveys dir is present, if not make it.
			 * 2) See if the folder for this survey is present, if not make it
			 * 3) Output file to folder.
			**/
			if($directory == $export_destination){
				foreach(scandir(storage_path().'/surveys') as $survey_folder){
					if($survey_folder == $survey_id){
						//write file in this folder
					}
				}
			} else {
				#If there isnt a directory, switch to the storage dir and then make one and make the sub folder
				chdir(storage_path());
				$dir = scandir('.');
				if(in_array('surveys', $dir)){
					chdir('surveys');
				} else {
					mkdir('surveys');
					chdir('surveys');
				}

				$dir = scandir('.');
				if(in_array($survey_id, $dir)){
					chdir($survey_id);
				} else {
					mkdir($survey_id);
					chdir($survey_id);
				}

				#Has to be an array of arrays
				// $dataSet = array($survey_keys, $survey_array, $spacer, $spacer,
				// 				 $page_keys, $page_array, $spacer, $spacer,
				// 				 $question_keys, $question_array);
				$dataSet = array($survey_array, $question_array, $answer_array, $page_array);

				$name 	= Date('Y_m_d_s');
				$fp 	= fopen($name.'.csv', 'w');
				foreach($dataSet as $line){
					fputcsv($fp, $line);
				}
				fclose($fp);
			}
		}
		return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
	}

	public function setSuggestionType($survey_id, $votingType){
			$allowed = array('all', 'investment', 'best');
			if(! in_array($votingType, $allowed)){
				return "incorrect voting type";
			}
			$survey = Survey::find($survey_id);
			$survey->votingType = $votingType;
			$survey->save();

			$message = "Survey $survey_id suggestion type updated to $votingType";
			return Redirect::to('admin/surveys/' . $survey->id)->with('flash_message', $message);
	}

	public function clear_data($survey_id){
			//Investments
			DB::statement('DELETE investments FROM investments INNER JOIN concepts ON concepts.id = investments.concept_id WHERE concepts.survey_id = ?', array($survey_id));

			//Suggestion Votes
			DB::statement('DELETE suggestion_votes FROM suggestion_votes INNER JOIN users ON users.id = suggestion_votes.user_id WHERE users.survey_id = ?', array($survey_id));

			//Suggestions
			DB::statement('DELETE suggestions FROM suggestions INNER JOIN concepts ON concepts.id = suggestions.concept_id WHERE concepts.survey_id = ?', array($survey_id));

			//Users
			User::where('survey_id', $survey_id)->delete();

			//Answers
			Answer::where('survey_id', $survey_id)->delete();


			$message = "Survey $survey_id cleared.";
			return Redirect::to('admin/surveys/' . $survey_id)->with('flash_message', $message);
	}


}