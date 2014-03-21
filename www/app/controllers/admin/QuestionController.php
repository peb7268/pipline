<?php

class admin_QuestionController extends \BaseController {
	protected $layout = 'layouts.admin';

	public function all($survey_id = null){
		$questions = Question::all();
		return View::make('admin.questions', compact('questions', 'survey_id'));
	}

	public function index($survey_id){
		$questions = Question::where('survey_id', $survey_id)->get();
		return View::make('admin.questions', compact('questions', 'survey_id'));
	}

	public function show($survey_id, $question_id){
		$question = Question::find($question_id);
		if ($question && $question->survey_id == $survey_id) {
			if ($question->category == 'best_questions'){$question->category = 'best_concept';$question->save();}
			if ($question->category == 'worst_questions'){$question->category = 'worst_concept';$question->save();}
			if ($question->category == 'demographic_questions'){$question->category = 'demographics';$question->save();}

			return self::question_form($question);
		}else{
			return Redirect::to('admin/surveys/'.$survey_id.'/questions')->with('flash_message', 'Error fetching question: Maybe you could try one of these?');
		}
	}

	public function create($survey_id = null)
	{
		$question = new Question;
		$question->survey_id = $survey_id;
		return self::question_form($question);
	}

	private function question_form($question)
	{
		($question->keys != '') ? $question->keys =
		json_decode($question->keys, true) : $question->keys = array();

		($question->options != '') ? $question->options =
		json_decode($question->options, true) : $question->options = array();

		($question->branching_data != '') ? $question->branching_data =
		json_decode($question->branching_data, true) : $question->branching_data = array();

		$pages 		= SurveyFactory::getDefaultPages($question->survey_id);
		$allPages 	= $pages;

		// $allPages 	= clone($pages);
		$survey 	= Survey::find($question->survey_id);

		//remove pages that cant have questions
		foreach($pages as $i=>$page){
			if (in_array($page->name, array_keys(Survey::$defaultTemplates))
				&& ! in_array($page->name, array('best_concept','worst_concept','demographics'))
			)
			{unset($pages[$i]);}
		}

		return View::make('admin.question', compact('question', 'allPages', 'survey'));
	}

	public function save($survey_id, $question_id = null){
		$input = Input::all();

		//build the branching data
		$branching_names = array('answer_value', 'branching_action', 'branching_target');
		$branching_data  = array();

        foreach($input as $name => $value){

			//answer_value_0
			//branching_action_0
			//branching_target_0
			foreach($branching_names as $v){
				if(strpos($name, $v) === 0){
					$branching_data[(Int) str_replace($v . '_', '', $name)][$v] = $value;
				}
			}
		}

		//convert branching data to be indexed of the option
		$new_branching_data = array();
		foreach ($branching_data as $branch_data)
		{
			if (trim($branch_data['answer_value']) === '')
			{
				continue;
			}

			$new_branching_data[(int)$branch_data['answer_value']] = array(
				'branching_action' => $branch_data['branching_action'],
				'branching_target' => $branch_data['branching_target'],
			);
		}

		$answers 		    = Input::get('answers');
		$keys 			    = Input::get('keys');
		//$option_values 	= Input::get('option_values');
		$option_texts 	    = Input::get('option_texts');
        $hidden             = Input::get('hidden_val');
        $required           = Input::get('question_required');


		$input['keys'] = array();
		if (empty($keys)){$keys = array();}
		foreach($keys as $key => $value){
			if($value == '') continue;
			//if ($value == '') die('An option was incomplete. Go back and fix.');
			$input['keys'][] = $value;
		}
		$input['keys'] = json_encode($input['keys']);

		$input['options'] = array();
		if (empty($option_texts)){$option_texts = array();}

		foreach($option_texts as $i => $val){
			if($val == '') continue;//die('An option was incomplete. Go back and fix.');
			$input['options'][] = $val;
		}
		$input['options'] = json_encode($input['options']);

		#If a question id is present update else create a new question
		if (isset($question_id)){
			$question = Question::find($question_id);
			if ($question && $question->survey_id == $survey_id) {


                $question->hidden   =  ($hidden == '0' || $hidden == null) ? false : true;
                $question->required =  ($required == '0' || $required == null) ? false : true;

                $question->fill($input);
				$question->branching_data = json_encode($new_branching_data, JSON_FORCE_OBJECT);
				$question->save();
				return Redirect::to('admin/surveys/' . $survey_id . '/questions/' . $question->id);
			}else{
				App::abort(500, 'Error fetching Question.');
			}
		} else {
			$question = new Question;
			$question->fill($input);
			$question->survey_id = $survey_id;
			$question->save();
			return Redirect::to('admin/surveys/' . $survey_id . '/questions/' . $question->id);
		}
	}

	public function delete($survey_id, $question_id)
	{
		$question = Question::find($question_id);
		if ($question && $question->survey_id == $survey_id) {
			$question->delete();
			return Redirect::to('admin/surveys/' . $survey_id);
		}else{
			App::abort(500, 'Error fetching Question.');
		}
	}

    public function duplicate($survey_id, $question_id)
    {
        $question = Question::find($question_id);
        $newQ     = new Question;
        $attrs    = $question->getAttributes();
        unset($attrs['id']);
        $newQ->fill($attrs);
        if($newQ->save()) return $newQ;
        return 0;
    }
}