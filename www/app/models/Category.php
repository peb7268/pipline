<?php

class Category extends Eloquent
{
	protected $table = 'categories';
	protected $fillable = array('name');

    public function categories()
    {
        return $this->belongsToMany('Survey', 'categories_surveys', 'category_id', 'survey_id');
    }
}