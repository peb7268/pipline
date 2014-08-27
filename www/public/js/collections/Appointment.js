define(['backbone', 'models/Appointment'], function(Backbone, AppointmentModel){

    var AppointmentCollection = Backbone.Collection.extend({
        url: 'api/v1/appointment',
        model: AppointmentModel,

        initialize: function(){}
    });

    return AppointmentCollection;
});
