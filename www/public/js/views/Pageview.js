define(['backbone', 'text!/js/templates/partials/list.html', 'text!/js/templates/partials/content.html'], function(Backbone, listTpl, agendaTpl){

    var Pageview = Backbone.View.extend({
        el: '#wrapper',
        tag: 'ul',
        render: function(){
            var listTemplate    = _.template(listTpl, {});
            var agendaTemplate  = _.template(agendaTpl, {});

            this.$el.append(listTemplate);
            this.$el.append(agendaTemplate);
        }
    });

    return Pageview;
});