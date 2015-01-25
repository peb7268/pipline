window.jQuery           = require('jquery');
window.$                = window.jQuery;

var angular             = require('angular');
var AppController       = require('./controllers/AppController.js').AppController;
var HomeController      = require('./controllers/AppController.js').HomeController;
var LoginController     = require('./controllers/AppController.js').LoginController;
var RegisterController  = require('./controllers/AppController.js').RegisterController;

require('angular-router-browserify')(angular);

var App = angular.module('App', ['ngRoute']);
App.controller('AppController', AppController);
App.controller('HomeController', HomeController);
App.controller('LoginController', LoginController);
App.controller('RegisterController', RegisterController);

App.config(['$routeProvider',
function($routeProvider, AppController){
    $routeProvider.
    when('/home', {
        templateUrl: './views/pages/home.html'
    }).
    when('/login', {
        templateUrl: './views/pages/login.html'
    }).
    when('/register', {
        templateUrl: './views/pages/register.html'
    })
    .otherwise({
        redirectTo: '/home'
    });
}]);

module.exports = App;
