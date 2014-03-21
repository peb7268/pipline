<?php

class Stock extends Eloquent
{
	protected $table = 'stocks';

	public function concept()
	{
		return $this->belongsTo('Concept', 'concept_id');
	}
	public function investments(){
		return $this->hasMany('Investment', 'stock_id');
	}
}