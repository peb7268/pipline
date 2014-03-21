require.config({
    waitSeconds: 60,
    paths: {
        jquery: 'vendors/jquery/dist/jquery',
        underscore: 'vendors/underscore/underscore',
        backbone: 'vendors/backbone/backbone',

        templates: '../templates'
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
        }
    }
});

define(['Router'], function(Router){
    router = new Router();
});
