define(['backbone'], function(Backbone){
    return Router = Backbone.Router.extend({
        routes: {
            ''				: 'start',
            'testem'		: 'start',
            ':page'			: 'setUpPage',
        },
        initialize: function(){
            Backbone.history.start();
        },
        start: function(){
            console.log('starting');
        }
    });
});