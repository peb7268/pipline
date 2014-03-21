<?php

class Concept extends Eloquent
{
	protected $table = 'concepts';
	protected $fillable = array('name', 'description', 'html', 'content', 'suevey_id', 'thumb_html');


    protected function getIdAttribute($value){
		return (int) $value;
	}

	protected function getSurveyIdAttribute($value){
		return (int) $value;
	}

	public function survey()
	{
		return $this->belongsTo('Survey', 'id');
	}

	public function investments(){
		return $this->hasMany('Investment', 'concept_id');
	}

	public function suggestions(){
		return $this->hasMany('Suggestion', 'concept_id');
	}

	public function suggestion_votes(){
		return $this->hasMany('Suggestion', 'concept_id');
	}

	public function purchasedShares($ignore_user = null){
		$investments = $this->investments;
		$sum = 0;
		foreach ($investments as $investment)
		{
			if (isset($ignore_user) && $ignore_user != $investment->user_id)
			{
				$sum += $investment->number_of_shares;
			}
		}
		return $sum;
	}

	public function vwapi($vwap = NULL, $concept_count = NULL){
		if (!isset($concept_count))
		{
			$concept_count = count(Survey::find($this->survey_id)->concepts);
		}

		if (!isset($vwap))
		{
			$vwap = $this->vwap();
		}

		return round(100*($vwap/(100/$concept_count)));
	}

	public function vwap(){
		$investments = $this->investments;
		$shares = 0;
		$total = 0;

		foreach ($investments as $investment)
		{
			if ($investment->number_of_shares == 0)
			{
				continue;
			}

			$shares += $investment->number_of_shares;
			$total += ($investment->number_of_shares * $investment->price_of_purchase);
		}

		if ($shares == 0)
		{
			return '0';
		}
		return $total/$shares;
	}

}