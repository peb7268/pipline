var AppController = function(CalendarService){
    var that = this;
    var dataFetch = CalendarService.init();

    dataFetch.success(function(){
        that.items = CalendarService.items;
    });

    this.toggleMenu = function(){
    	var $el = $(event.target);
    	if(event.target.nodeName != 'I') $el = $el.find('i');
    	$el.toggleClass('open');

    	$('#nav ul').slideToggle(100);
    };
};

module.exports = AppController;
