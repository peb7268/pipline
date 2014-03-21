<?php
	class Answer extends Eloquent
	{
		protected $table = 'answers';
		protected $fillable = array('question_id', 'response_text', 'option_ids', 'user_id', 'survey_id', 'concept_id');
	}
?>