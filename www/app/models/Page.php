<?php

class Page extends Eloquent {
	protected $table 	= 'pages';
	protected $fillable = array('name', 'hash', 'html', 'template', 'type');

	public function survey(){
		return $this->belongsTo('Survey');
	}
}