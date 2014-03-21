define(['backbone', 'app'], function(Backbone, App){
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
            window.app = new App();
            app.start();
        }
    });
});