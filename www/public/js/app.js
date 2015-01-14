'use strict';

require('angular');
require('angular-route');
require('angular-animate');
require('angular-resource');

var controllers = require('./controllers/AppController.js');

var App = angular.module('App', ['ngRoute', 'AppController']);

App.config(['$routeProvider'], function($routeProvider){
    $routeProvider.
        when('/hello', {
            templateUrl: '../views/pages/hello',
            controller: 'AppController'
        }).otherwise({
            redirectTo: '/hello'
        });
});

