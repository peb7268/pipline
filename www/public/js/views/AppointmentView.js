define([
    'backbone',
    'text!templates/partials/_list_item.html',
    'models/Appointment'
],
    function(Backbone, listTpl, Appointment){
        var appointment;
        var that;

        var AppointmentView = Backbone.View.extend({
            el: '#agenda',
            tag: 'li',
            model: Appointment,

            initialize: function(){
                that = this;
            },

            render: function(){
                var liTpl  = _.template(listTpl, this.model.toJSON());
                this.$el.append(liTpl);
            }
        });

        return AppointmentView;
    });
