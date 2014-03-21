<?php

class Suggestion extends Eloquent
{
	protected $table = 'suggestions';
	protected $fillable = array('user_id', 'concept_id', 'description');

	public function suggestionVotes(){
		return $this->hasMany('SuggestionVote', 'suggestion_id');
	}
}