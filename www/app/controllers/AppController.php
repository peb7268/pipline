<?php

class AppController extends \BaseController {
	public function contactForm(){
		return View::make('contact');
	}

	public function processForm(){
		$data = array();
		parse_str(Input::all()['data'], $data);
		$name  = $data['first_name']. ' '. $data['last_name'];

		if(strlen($name) > 1) return "Thank you " . $name . ' for your inquiry.';
		return;
	}
}
