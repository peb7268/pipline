define(['backbone'], function(Backbone){
    var Appointment = Backbone.Model.extend({
        url: 'api/v1/appointment'
    });

    return Appointment;
});
