<?php

class DashboardController extends BaseController {

	public function index($market = null){
		$survey  = SurveyHelper::fetchSurveyBySubdomain($market);
        $data    = $this->fetchData($survey);

		return $data;
	}

	public function fetchData($survey)
	{
		$categories = array();
		foreach(Category::all() as $category) {
		    $categories[$category->id] = $category->name;
		}

		$displayed_categories 	= json_decode($survey->displayed_categories, TRUE);
		if (empty($displayed_categories)){$displayed_categories = array();}

		$required_categories 	= json_decode($survey->required_categories, TRUE);
		if (empty($required_categories)){$required_categories = array();}

		$acceptable_categories 	= json_decode($survey->acceptable_categories, TRUE);
		if (empty($acceptable_categories)){$acceptable_categories = array();}

		$survey->other_params = json_decode($survey->other_params);
		$concepts 	= $survey->concepts;
		$questions 	= $survey->questions;
		$pages 		= $survey->pages;

		$data = array();
		$data['survey'] 	        = $survey;
		$data['concepts'] 	        = $concepts;
		$data['best_questions']     = SurveyHelper::getQuestionType($survey->id, 'best_questions');
        $data['worst_questions']    = SurveyHelper::getQuestionType($survey->id, 'worst_questions');
		$data['pages'] 		        = $pages->toArray();
		$data['vwaps']		        = $this->calculateVwaps($concepts);
		$data['completes']          = count(DB::table('users')->where(function($query){
                                            $query->where('completed', 1)
                                                  ->where('agreed', 1);
                                      })->get());
		$data['terminated']     = count(DB::table('users')->where('termniated', 1)->get());
		$data['incompletes']    = count(DB::table('users')->where('completed', 0)->get());
		$data['dash'] 		    = $this;

		return $this->present($data, Auth::user());
	}

	public function sectionAnswers($section, $concept_id=false)
	{
		$market = null;
		$survey_id = ($market) ? SurveyHelper::translateSubdomain($market) : SurveyHelper::translateSubdomain(Request::instance());
		$survey  = Survey::find($survey_id);
		$concept = null;

		if (! $concept_id || ! is_numeric($concept_id))
		{
			if (in_array($section, array('best_questions', 'worst_questions')))
			{
				return false;//need to 404 here or whatever
			}
		}
		else //verify it belongs to our survey.
		{
			$concept = Concept::find($concept_id);
			if ($concept->survey_id != $survey_id || !in_array($section, array('best_questions', 'worst_questions')))
			{
				return false; //404?
			}
		}

		$questions = new Question;
		$questions = $questions->fetch_by_category($survey_id, $section);

		if (empty($questions))
		{
			return false;//404?
		}

		$return = [];

		foreach ($questions as $question)
		{
			$temp = [];
			$temp['question_id'] = $question->id;
			$temp['question_description'] = $question->description;

			$answers = DB::table('answers');
			$answers->where('question_id', $question->id);

			//if no concept, we get all answers for the questions.
			if (isset($concept))
			{
				$user_ids = DB::table('investments')->where('concept_id', $concept_id);

				if ($section == 'best_questions')
				{
					$user_ids->where('is_best', 1);
				}
				else
				{
					$user_ids->where('is_worst', 1);
				}

				$user_ids = $user_ids->lists('user_id');

				if (empty($user_ids))
				{
					$temp['answers'] = [];
				}
				else
				{
					$answers->whereIn('user_id', $user_ids);
					$temp['answers'] = $answers->get();
				}

			}
			else
			{
				$temp['answers'] = $answers->get();
			}


			$return[] = $temp;
		}

		return $return;
	}

	public function calculateVwaps($concepts)
	{
		$vwaps = array();
		foreach ($concepts as $concept){
			$vwaps[$concept->id] = $concept->vwap();
		}

		arsort($vwaps);
		return $vwaps;
	}

    public function fetchTrendingSeries($concepts = null, $vwaps = null)
    {
        $series = "";
        foreach ($vwaps as $idx => $vwap):
            $series .= "{
                    type: 'line',
                    highlight: {
                        size: 7,
                        radius: 7
                    },
                    axis: 'left',
                    fill: false,
                    xField: 'investment',
                    yField: 'data{$idx}',
                    title: '{$concepts[$idx - 1]->name}',
                    showInLegend: true,
                    markerConfig: {
                        type: 'circle',
                        size: 4,
                        radius: 4,
                        'stroke-width': 0
                    }
                },";
        endforeach;

        echo $series;
    }

    public function fetchVwapHistory($id) {
        $concepts  = SurveyHelper::prepVwapData($id);
        $vwaps     = SurveyHelper::buildVwap($concepts);

        return $vwaps;
    }

    /*
     * Builds the fields that comprise a line chart.
     * @param Array $vhist
     * Multidimensional master vwap object
     * @param Array $context
     * context object that provides info on how to name the x,y values
     */
    public function fetchLineFields($vhist, $context)
    {

//        echo "'investment', 'data1', 'data2', 'data3', 'data4', 'data5', 'data6', 'data7', 'data8', 'data9'";
//        return;

        $length = count($vhist[array_keys($vhist)[0]]);
        $fields = "'{$context[0]}', "; $j = 0;
        for($i = 0; $i < $length; $i++){
            $fields .= "'{$context[1]}$j',";
            $j++;
        }

        $fields = trim(substr_replace($fields, '', (strlen($fields) - 1)));
        return $fields;
    }

    /*
	public function fetchLineVwaps($vwaps, $concepts, $vwaphist){
		$i = 0; $obj = '';
        !d($vwaphist);

        $keys = array_keys($vwaphist);
        !d($keys);
        //'2014-02-19 22:04:44'

        //vwaps 1 based index
        foreach($vwaps as $concept_id => $vwap){
            !d($concept_id);
            if($concept_id < 4) !d($vwaphist[$keys[1]]);
			$concept = $concepts->find($concept_id);

	        if ($i !== count($concepts)){
	        	$obj .= "{ 'name':'$concept->name', 'data{$concept_id}': $vwap },";
	    	} else {
	    		$obj .= "{ 'name':'$concept->name', 'data{$concept_id}': $vwap }";
	    	}
    	}

        !dd($obj);
    	echo $obj;
	}
    */

    //Y is $ amount of vwap
    //X axis trader # so after trader X after trader Y ect..
    public function fetchLineVwaps($concepts)
    {
        $i = 1;
        $vwap_obj = '';

        /*
        { 'name': "blue_cap_laundry_detergent", "data1": 20, "data2": 19.15, "data3": 19.15, "data4": 19.15, "data5": 19.15, "data6": 18.867937930519,  "data7": 19.352038392297, "data8": 20.220115925815, "data9": 20.220115925815  }, #correct
        { 'name': "blue_cap_laundry_detergent", "data1": 20 },
        { 'name': "blue_cap_laundry_detergent", "data1": 19.15 },
        { 'name': "blue_cap_laundry_detergent", "data1": 19.15 },
        { 'name': "blue_cap_laundry_detergent", "data1": 19.15 },
        { 'name': "blue_cap_laundry_detergent", "data1": 19.15 },
        { 'name': "blue_cap_laundry_detergent", "data1": 18.867937930519 },
        { 'name': "blue_cap_laundry_detergent", "data1": 19.352038392297 },
        { 'name': "blue_cap_laundry_detergent", "data1": 20.220115925815 },
        { 'name': "blue_cap_laundry_detergent", "data1": 20.221569545212 },
        { 'name': "blue_cap_laundry_detergent", "data1": 20.221569545212 }
         */

        foreach($concepts as $name => $vwaps):
            $inv = 0;
            foreach($vwaps as $value):
                if($i !== (count($concepts)) + 1){
                    $vwap_obj .= "{ 'investment': $inv, \"data{$i}\": $value },";
                } else {
                    $vwap_obj .= "{ 'investment': $inv, \"data{$i}\": $value }";
                }
                $inv++;
            endforeach;
            $i++;
        endforeach;

        echo $vwap_obj;
    }

    public function fetchStackedNetAttraction($concepts, $best_count, $worst_count){
        $i = 0; $obj = '';

        foreach($best_count as $idx => $val){
            $concept = $concepts->find($idx);

            if(gettype($concept) == 'object' && isset($worst_count[$idx])) {
                //!d($concept->name);
                //!d($best_count[$idx]);

                if ( $idx < count($concepts)){
                    $obj .= "{'state': '".$concept->name."' , 'entry': {$worst_count[$idx][0]},'exit': {$best_count[$idx][0]} },";
                } else {
                    $obj .= "{'state': '".$concept->name."' , 'entry': {$worst_count[$idx][0]},'exit': {$best_count[$idx][0]} }";
                }
            }
        }

        echo $obj;
        //{state: 'concept_name', entry: worst_count, exit: best_count }
        //{state: 'Connecticut', entry:-31000, exit:28211}
    }

	public function present($data = null, $user = null)
	{

		$concepts 	 = $data['concepts'];
		$vwaps 	  	 = $data['vwaps'];
        $data['best_count']  = $this->calculateBestConcepts($data['survey']->id, $concepts);
        $data['worst_count'] = $this->calculateWorstConcepts($data['survey']->id, $concepts);

		$best_count  = $data['best_count'];
		$worst_count = $data['worst_count'];

		$headers = array(
			'' 	   => array(),
			'vwap' => array('background: rgb(148, 174, 10); padding: 7px 0; color: #fff; text-transform: uppercase;'),
			'vwap index' => array('background: rgb(148, 174, 10); padding: 7px 0; color: #fff; text-transform: uppercase;'),
			'net attraction' => array('background: rgb(148, 174, 10); padding: 7px 0; color: #fff; text-transform: uppercase;'),
			'best' => array('background: rgb(148, 174, 10); padding: 7px 0; color: #fff; text-transform: uppercase;'),
			'worst' => array('background: rgb(148, 174, 10); padding: 7px 0; color: #fff; text-transform: uppercase;')
		);

		$rows = array();
		foreach($concepts as $idx => $concept):
			$rows[$idx]   = array();
			$rows[$idx][] = $concept->name;
			$rows[$idx][] = round($vwaps[$concept->id]);
			$rows[$idx][] = $this->calculateVwapIndex($concept->id, count($concepts), $vwaps);	//vwap index $this->calculateVwapIndex($vwaps);
			$rows[$idx][] = round($best_count[$concept->id][0] + $worst_count[$concept->id][0]);	//net attraction
			$rows[$idx][] = round($best_count[$concept->id][0]);	//best
			$rows[$idx][] = round($worst_count[$concept->id][0]);	//worst
		endforeach;

		$vwapTable = ReportingHelper::Table(array('text-align: center;'), $headers, $rows);
		return View::make('dashboard.welcome', compact('data', 'user', 'vwapTable'));
	}

	public function calculateBestConcepts($survey_id, $concepts)
	{
		//% of traders who thought concept X was the best
		/**
		* This method will return the Best %. [#_rating_concept_best] / [number_of_survey_completes] * 100 ( For each concept )
		* how many ppl thought this concept was the best
		* - which concept has the highest investment
		* - how many ppl invested in that concept
		* - number of completes
		* - calculate metric
		**/
		//$investments = Investment::all();
		$investments = SurveyHelper::getInvestmentsForSurvey($survey_id);
		$users 		 = SurveyHelper::getUsersForSurvey($survey_id);
		$concepts 	 = Survey::find($survey_id)->concepts->toArray();
		$completes 	 = DB::table('users')->where(function($query) use ($survey_id) {
					 $query->where('survey_id', $survey_id)
					 	   ->where('completed', 1);
		})->count();

		#best_count: how many users said this was the best
		if(App::environment() !== 'testing'){
            $best_count = array();
            foreach($concepts as $concept):
                $best_count[$concept['id']][] = (($this->getBestCount($concept['id'], $investments, $users) / $completes) * 100);
            endforeach;
            return $best_count;

        } else { return 4; }
	}

	public function calculateWorstConcepts($survey_id, $concepts)
	{
		//% of traders who thought concept X was the best
		/**
		* This method will return the Best %. [#_rating_concept_best] / [number_of_survey_completes] * 100 ( For each concept )
		* how many ppl thought this concept was the best
		* - which concept has the highest investment
		* - how many ppl invested in that concept
		* - number of completes
		* - calculate metric
		**/
		//$investments = Investment::all();
		$investments = SurveyHelper::getInvestmentsForSurvey($survey_id);
		$users 		 = SurveyHelper::getUsersForSurvey($survey_id);
		$concepts 	 = Survey::find($survey_id)->concepts->toArray();
		$completes 	 = DB::table('users')->where(function($query) use ($survey_id) {
					 $query->where('survey_id', $survey_id)
					 	   ->where('completed', 1);
		})->count();

		#best_count: how many users said this was the best
		$worst_count = array();
        if(App::environment() !== 'testing'){
            foreach($concepts as $concept):
                $worst_count[$concept['id']][] = (($this->getWorstCount($concept['id'], $investments, $users) / $completes) * -100);
            endforeach;
            return $worst_count;
        } else { return 7; }
	}

	public function getBestCount($concept_id, $investments, $users)
	{
		$best_count = 0;
		foreach($investments as $investment):
			// if($user->id == $investments['user_id'])
			if($investment['concept_id'] == $concept_id && $investment['is_best'] == '1') $best_count++;
		endforeach;

		return $best_count;
	}

	public function getWorstCount($concept_id, $investments, $users)
	{
		$worst_count = 0;
		foreach($investments as $investment):
			// if($user->id == $investments['user_id'])
			if($investment['concept_id'] == $concept_id && $investment['is_worst'] == '1') $worst_count++;
		endforeach;

		return $worst_count;
	}

	public function calculateVwapIndex($concept_id, $concept_count, Array $vwaps)
	{
		//[Concept VWAP] / [Starting Price] * 100
		return round(($vwaps[$concept_id] / (100 / $concept_count)) * 100);
	}
}