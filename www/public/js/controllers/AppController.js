var HomeController              = require('./HomeController');
var CalendarController          = require('./CalendarController');
var LoginController             = require('./LoginController');
var RegisterController          = require('./RegisterController');

var controllers = {};

controllers.AppController = function($scope){
    this.toggleMenu = function(){
    	var $el = $(event.target);
    	if(event.target.nodeName != 'I') $el = $el.find('i');
    	$el.toggleClass('open');

    	$('#nav ul').slideToggle(100);
    };
};

controllers.CalendarController  = CalendarController;
controllers.HomeController      = HomeController;
controllers.LoginController     = LoginController;
controllers.RegisterController  = RegisterController;

module.exports = controllers;
