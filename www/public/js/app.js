window.jQuery           = require('jquery');
window.$                = window.jQuery;
var angular             = require('angular');

//Temp mock, later will bind the uid to the view while logged in or put it in local storage
window.App = (typeof App != 'undefined') ? App : {};
var App = window.App;
App.user = {};
App.user.id = 7;

var App = require('./controllers');

module.exports = App;
