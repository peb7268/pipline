(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"/Users/peb7268/Desktop/dev/vagrant/play/pipeline/www/public/js/app.js":[function(require,module,exports){
require('./controllers/AppController.js');

var App = angular.module('App', ['ngRoute', 'appControllers']).config(['$routeProvider',

function($routeProvider){
    $routeProvider.
    when('/home', {
        templateUrl: './views/pages/home.html',
        controller: 'AppCtrl'
    }).
    when('/login', {
        templateUrl: './views/pages/login.html',
        controller: 'LoginCtrl'
    }).
    when('/register', {
        templateUrl: './views/pages/register.html',
        controller: 'RegisterCtrl'
    })
    .otherwise({
        redirectTo: '/home'
    });
}]);

var App = {};
module.exports = App;

},{"./controllers/AppController.js":"/Users/peb7268/Desktop/dev/vagrant/play/pipeline/www/public/js/controllers/AppController.js"}],"/Users/peb7268/Desktop/dev/vagrant/play/pipeline/www/public/js/controllers/AppController.js":[function(require,module,exports){
var appControllers = angular.module('appControllers', []);

appControllers.controller('AppCtrl', ['$scope',
    function($scope){
        console.log('AppCtrl');
}]);

appControllers.controller('LoginCtrl', ['$scope',
    function($scope){
        console.log('LoginCtrl');
}]);

appControllers.controller('RegisterCtrl', ['$scope',
    function($scope){
        console.log('RegisterCtrl');
}]);

module.exports = appControllers;

},{}]},{},["/Users/peb7268/Desktop/dev/vagrant/play/pipeline/www/public/js/app.js"]);
