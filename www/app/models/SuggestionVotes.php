<?php

class SuggestionVote extends Eloquent
{
	protected $table = 'suggestion_votes';
	protected $fillable = array('user_id', 'suggestion_id', 'up_or_down');

	public function suggestion()
	{
		return $this->belongsTo('Suggestion', 'suggestion_id');
	}

}