window.jQuery           = require('jquery');
window.$                = window.jQuery;

var angular             = require('angular');
var AppController       = require('./controllers/AppController.js').AppController;
var AgendaController    = require('./controllers/AppController.js').AgendaController;
var CalendarController  = require('./controllers/AppController.js').CalendarController;
var LoginController     = require('./controllers/AppController.js').LoginController;
var RegisterController  = require('./controllers/AppController.js').RegisterController;

require('angular-router-browserify')(angular);

var App = angular.module('App', ['ngRoute']);
App.controller('AppController', AppController);
App.controller('AgendaController', ['$http', AgendaController]);
App.controller('CalendarController', ['$http', CalendarController]);
App.controller('LoginController', LoginController);
App.controller('RegisterController', ['$http', RegisterController]);

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
