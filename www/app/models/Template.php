<?php

class Template extends Eloquent {
	protected $table 	= 'templates';
	protected $fillable = array('name', 'original', 'template');


}