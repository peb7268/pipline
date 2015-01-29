var HomeController              = require('./HomeController');
var CalendarController          = require('./CalendarController');
var LoginController             = require('./LoginController');
var RegisterController          = require('./RegisterController');

var controllers = {};

controllers.AppController = function($scope){
    var self = this;
};

controllers.CalendarController  = CalendarController;
controllers.HomeController      = HomeController;
controllers.LoginController     = LoginController;
controllers.RegisterController  = RegisterController;

module.exports = controllers;
