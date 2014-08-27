//http://stackoverflow.com/questions/19240302/does-jasmine-2-0-really-not-work-with-require-js
//Run testem from local actual computer, not vagrant vm
require.config({
    baseUrl: '/../../public/js',

    waitSeconds: 60,
    paths: {
        jquery: 'vendors/jquery/dist/jquery',
        underscore: 'vendors/underscore/underscore',
        backbone: 'vendors/backbone/backbone',
        templates: 'templates/',
        spec: "../../spec",
        jasmine: 'vendors/jasmine/lib/jasmine-2.0.0/jasmine',
        'jasmine-html': 'vendors/jasmine/lib/jasmine-2.0.0/jasmine-html',
        'jasmine-boot': 'vendors/jasmine/lib/jasmine-2.0.0/boot',
        'jasmine-jquery': 'vendors/jasmine-jquery/lib/jasmine-jquery',
        'sinon': 'vendors/sinon/lib/sinon'
    },
    shim: {
        'jquery': {
            exports: 'jQuery'
        },
        'underscore': {
            exports: '_'
        },
        'backbone': {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        },
        'jasmine': {
            exports: 'jasmine'
        },
        'jasmine-html':{
            deps: ['jasmine'],
            exports: 'jasmine'
        },
        'jasmine-boot':{
            deps: ['jasmine', 'jasmine-html', 'jquery', 'jasmine-jquery'],
            exports: 'jasmine'
        }
    }
});

//Not actually using the jasmine shims above but they're there anyway for refrence.

//Include spec files here...
var specs = ['../../specs/views/PageviewSpec.js'];

//Boot the tests up
require(['jquery', 'sinon'], function(){
    $('document').ready(function($){
        require(specs, function () {
            // Initialize the HTML Reporter and execute the environment (setup by `boot.js`)
            //Had to modify jasmine boot.js to bind htmlReporter and env to the window and make them global.
            //That fixed the double booting status bar issue
            htmlReporter.initialize();
            env.execute();
            window.onload();
        });
    });
});