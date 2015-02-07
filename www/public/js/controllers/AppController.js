var AppController = function(CalendarService){
    this.items = [];

    this.init = function(){
        var self = this;
        CalendarService.req.success(function(data, status, headers, config) {
            self.items = data;
        })
        .error(function(data, status, headers, config) {
            console.error(status, data);
        });
    };

    this.toggleMenu = function(){
    	var $el = $(event.target);
    	if(event.target.nodeName != 'I') $el = $el.find('i');
    	$el.toggleClass('open');

    	$('#nav ul').slideToggle(100);
    };

    this.init()

};

module.exports = AppController;
