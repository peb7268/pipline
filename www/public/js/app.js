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
