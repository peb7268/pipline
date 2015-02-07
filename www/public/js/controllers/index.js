var App = angular.module('App', ['ngRoute']);


var AppController       = require('./AppController');
var AgendaController    = require('./AgendaController.js');
var CalendarController  = require('./CalendarController.js');
var LoginController     = require('./LoginController.js');
var RegisterController  = require('./RegisterController.js');

App.controller('AppController', AppController);
App.controller('AgendaController', ['$http', 'CalendarService', AgendaController]);
App.controller('CalendarController', ['$http', 'CalendarService', CalendarController]);
App.controller('LoginController', LoginController);
App.controller('RegisterController', ['$http', RegisterController]);


module.exports = App;