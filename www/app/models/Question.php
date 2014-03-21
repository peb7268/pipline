<?php
	class Question extends Eloquent
	{
		protected $table 	= 'questions';
        protected $fillable = array('survey_id', 'question_type', 'description', 'options', 'category', 'keys', 'answers', 'hidden', 'required');


		public function fetch_by_category($survey_id, $categories, $user_id = false){


			if (!$survey_id || empty($categories)){
                die('Error');
            }

			if (! is_array($categories)){$categories = array($categories);}

			$questions = DB::table('questions');

			$get = array('questions.*');

			if ($user_id)
			{
				$questions->leftJoin('answers', function($join) use ($user_id)
		        {
		            $join->on('questions.id', '=', 'answers.question_id')
		            ->on('answers.user_id', '=', DB::raw($user_id));
		        });

		        $get[] = 'answers.option_ids';
		        $get[] = 'answers.response_text';
		    }

			$questions = $questions->where('questions.survey_id', '=', DB::raw($survey_id))
			->whereIn('questions.category', $categories)
			->get($get);

			return $questions;
		}

		public function fetch_uncategorized($survey_id, $user_id = false){

			if (!$survey_id){die('Error');}

			$questions = DB::table('questions');

			$get = array('questions.*');

			if ($user_id)
			{
				$questions->leftJoin('answers', function($join) use ($user_id)
		        {
		            $join->on('questions.id', '=', 'answers.question_id')
		            ->on('answers.user_id', '=', DB::raw($user_id));
		        });

		        $get[] = 'answers.option_ids';
		        $get[] = 'answers.response_text';
		    }

			$questions = $questions->where('questions.survey_id', '=', DB::raw($survey_id))
			->whereNotIn('category', array('best_concept', 'worst_concept', 'demographics'))
			->get($get);

			return $questions;
		}
	}
?>