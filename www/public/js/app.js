define(['views/Pageview'], function(Pageview){
    var App = function(){
        this.Views  = {};
        this.Models = {};
        this.Views.Pageview = Pageview;
        this.instances = { views: {} };
        this.start  = function(){
            $('document').ready(function(){
                var pageview = new Pageview({});
                pageview.render();
            });
        }
    };

    return App;
});