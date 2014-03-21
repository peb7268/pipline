<?php
class Investment extends Eloquent{
	protected $table 	= 'investments';
	protected $fillable = array('number_of_shares', 'price_of_purchase', 'concept_id', 'user_id', 'is_best', 'is_worst');

	protected function getIdAttribute($value){
		return (int)$value;
	}

	protected function getUserIdAttribute($value){
		return (int)$value;
	}

	protected function getConceptIdAttribute($value){
		return (int)$value;
	}

	protected function getIsBestAttribute($value){
		return (int)$value;
	}

	protected function getNumberOfSharesAttribute($value){
		return (float)$value;
	}

	protected function getIsWorstAttribute($value){
		return (int)$value;
	}

	public function users(){
		return $this->hasOne('User', 'user_id');
	}

	public function concept(){
		return $this->hasOne('Concept', 'concept_id');
	}
}