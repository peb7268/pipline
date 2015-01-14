'use strict';

var angular         = require('angular');
require('angular-route');
require('angular-animate');

var app = angular.module('App', ['ngAnimate', 'ngRoute']);

// one require statement per sub directory instead of one per file
//require('./service');
//require('./controller');