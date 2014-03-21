<?php
class Survey extends Eloquent
{
	protected $table = 'surveys';
	protected $fillable = array('name','displayed_categories','required_categories','acceptable_categories', 'unique_param', 'other_params', 'quota', 'page_order', 'study_type', 'background_image', 'errors');

	protected 	    $guarded = array('id');
	public 		    $timestamps = false;
    public          $errors = array();
	public 	static	$defaultTemplates = array(
		'intro' => 'default',
		'categories' => 'default',
		'agreement' => 'default',
		'background' => 'default',
		'instructions' => 'default',
		'concept' => 'default',
		'buy' => 'default',
		'best_concept' => 'default',
		'worst_concept' => 'default',
		'suggestions' => 'default',
		'demographics' => 'default',
		'finish' => 'default',
		'buy_fail' => 'optional',
		'category_fail' => 'optional',
		'thank_you_fail' => 'optional',
		'quota_met' => 'optional'
	);

	//Returns all categories associated with this survey
	public function display_categories()
	{
		$display_categories = json_decode($this->displayed_categories);
		if (empty($display_categories)){return array();}
		$categories = DB::table('categories')->whereIn('id', $display_categories)->get();
		foreach ($categories as $i=>$category){
			$categories[$i]->id = (int)$category->id;
		}
		return $categories;
	}

	public function concepts()
	{
		return $this->hasMany('Concept', 'survey_id');
	}

	public function users()
	{
		return $this->hasMany('User', 'survey_id');
	}

	public function questions()
	{
		return $this->hasMany('Question', 'survey_id');
	}

	public function pages(){
		return $this->hasMany('Page', 'survey_id');
	}

    public function categories()
    {
      return $this->belongsToMany('Category', 'categories_surveys', 'survey_id', 'category_id');
    }

	public function vwap_history(){
		$survey_id = $this->id;
		$investments = Investment::join('concepts', 'concepts.id', '=', 'investments.concept_id')
		->where('concepts.survey_id', $this->id)->where('investments.number_of_shares', '>', 0)->orderBy('investments.updated_at', 'asc')->get(array('investments.*'));

		$concepts = $this->concepts;

		$vwaps = array();

		$tempVWAP = array();
		foreach($concepts as $concept)
		{
			$tempVWAP[$concept->id]['shares'] = 0;
			$tempVWAP[$concept->id]['spent'] = 0;
			$tempVWAP[$concept->id]['vwap'] = 0;
		}

		$time = '';
		foreach($investments as $investment)
		{
			if (! isset($tempVWAP[$investment->concept_id]))
			{
				//ignore bad investments in concepts that no longer exist.
				continue;
			}

			if ($investment->updated_at != $time)
			{
				//finish out the old group
				if ($time != '')
				{
					foreach($concepts as $concept)
					{
						if (!isset($vwaps[$time][$concept->id]))
						{
							$vwaps[$time][$concept->id] = $tempVWAP[$investment->concept_id]['vwap'];
						}
					}
					ksort($vwaps[$time]);
				}

				$time = $investment->updated_at->__toString();
				$vwaps[$time] = array();

			}


			$tempVWAP[$investment->concept_id]['shares'] += $investment->number_of_shares;
			$tempVWAP[$investment->concept_id]['spent']+= $investment->number_of_shares * $investment->price_of_purchase;

			$tempVWAP[$investment->concept_id]['vwap'] = $tempVWAP[$investment->concept_id]['spent']/$tempVWAP[$investment->concept_id]['shares'];

			$vwaps[$time][$investment->concept_id] = $tempVWAP[$investment->concept_id]['vwap'];
		}

		//one last group finish
		if ($time != '')
		{
			foreach($concepts as $concept)
			{
				if (! isset($tempVWAP[$concept->id]))
				{
					//ignore bad investments in concepts that no longer exist.
					continue;
				}

				if (!isset($vwaps[$time][$concept->id]))
				{
					$vwaps[$time][$concept->id] = $tempVWAP[$concept->id]['vwap'];
				}
			}
			ksort($vwaps[$time]);
		}

		return $vwaps;

	}

    public function quotaMet($survey){
        if ($survey->quota !== '' || $survey->quota !== '0'){
            $completes = User::completes($survey->id);
            if ($completes >= $survey->quota){
                return true; //die('Survey Closed (quota).');
            }
        }
    }
}