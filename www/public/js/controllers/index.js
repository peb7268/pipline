var App = angular.module('App', [require('angular-ui-router/release/angular-ui-router')]).config(function($stateProvider){
    //$locationProvider.html5Mode(true);
    //$locationProvider.hashPrefix('!');

    $stateProvider.state('home', {
        url: '/',
        templateUrl: './views/pages/home.html',
        controller: require('./AgendaController.js')
    });

    $stateProvider.state('login', {
        url: '/login',
        templateUrl: './views/pages/login.html',
        controller: require('./LoginController.js')
    });

    $stateProvider.state('register', {
        url: '/register',
        templateUrl: './views/pages/register.html',
        controller: require('./RegisterController.js')
    });
});

var CalendarService     = require('../services/CalendarService.js');

App.factory('CalendarService', ['$http', '$rootScope', CalendarService]);


var AppController       = require('./AppController');
var AgendaController    = require('./AgendaController.js');
var CalendarController  = require('./CalendarController.js');
var LoginController     = require('./LoginController.js');
var RegisterController  = require('./RegisterController.js');

App.controller('AppController', AppController);
App.controller('AgendaController', ['$http', 'CalendarService', AgendaController]);
App.controller('CalendarController', ['$http', 'CalendarService', CalendarController]);
App.controller('LoginController', LoginController);
App.controller('RegisterController', ['$http', '$scope', RegisterController]);


module.exports = App;