var HomeController              = require('./HomeController');
var LoginController             = require('./LoginController');
var RegisterController          = require('./RegisterController');

var controllers = {};

controllers.AppController = function($scope){
    var self = this;
};

controllers.HomeController      = HomeController;
controllers.LoginController     = LoginController;
controllers.RegisterController  = RegisterController;

module.exports = controllers;
