define([
    'backbone',
    'text!templates/agenda.html',
    'text!templates/partials/_list_item.html',
    'collections/Appointment',
    'views/AppointmentView'
],

function(Backbone, agendaTpl, liTpl, AppointmentCollection, AppointmentView){
     var appointments;
     var that;

     var AgendaView = Backbone.View.extend({
        el: $('#agenda'),
        tag: 'ul',

        initialize: function(){
            that = this;
            that.AppointmentView = AppointmentView;
            appointments = new AppointmentCollection();
            appointments.fetch().done(function(){
                that.render();
            });
        },

        render: function(){
            var agendaTemplate  = _.template(agendaTpl);
            $('#wrapper').append(agendaTemplate);
            this.$el.append(agendaTemplate);

            appointments.each(function(model, idx){
                var view = new AppointmentView({ model: model });
                view.render();
            });
        },

         attatchToList: function ($list){
            //Build a view in the following method
            var data = this.buildDataFromContent();
            var model = appointments.create({
                'name': data.apt_name,
                'details': data.apt_details
            });
            var view = new AppointmentView({ model: model });


            //Use a partial to build this list item
            var html = _.template(liTpl, view.model.toJSON());

            //Append it to the agenda
            $list.append(html);
         },

         buildDataFromContent: function(){
            var inputs = $('input, textarea', '#content .active');
            var vals   = [];
            var master = {};

            $.each(inputs, function(idx, elem){
                var data  = {};
                data[$(elem).attr('name')] = $(elem).val();
                vals.push(data);
            });


            _.each(vals, function(elem, idx){
                for(key in elem){
                    master[key] = elem[key]
                }
            });


            return master;
         }
     });

     return AgendaView;
});