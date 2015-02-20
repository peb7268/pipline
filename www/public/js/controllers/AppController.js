var AppController = function(CalendarService){
    CalendarService.init();
    this.items = CalendarService.items;

    this.toggleMenu = function(){
    	var $el = $(event.target);
    	if(event.target.nodeName != 'I') $el = $el.find('i');
    	$el.toggleClass('open');

    	$('#nav ul').slideToggle(100);
    };
};

module.exports = AppController;
