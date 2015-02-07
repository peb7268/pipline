window.jQuery           = require('jquery');
window.$                = window.jQuery;
var angular             = require('angular');
require('angular-router-browserify')(angular);


var App = require('./controllers');
var CalendarService     = require('./services/CalendarService.js');

App.factory('CalendarService', ['$http', CalendarService]);

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
