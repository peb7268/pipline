//http://stackoverflow.com/questions/19240302/does-jasmine-2-0-really-not-work-with-require-js
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
            deps: ['jasmine', 'jasmine-html', 'jquery'],
            exports: 'jasmine'
        },
        'jasmine-jquery':{
            deps: ['jasmine-boot'],
            exports: 'jasmine-jquery'
        }
    }
});

//Include spec files here...
var specs = ['../../../../spec/js/views/PageviewSpec.js'];

//Boot the tests up
require(['jasmine-boot', 'jasmine-jquery', 'sinon', '/testem.js'], function(){
    require(specs, function () {
        // Initialize the HTML Reporter and execute the environment (setup by `boot.js`)
        window.onload();
    });
});