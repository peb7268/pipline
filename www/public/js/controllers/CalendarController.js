var CalendarController = function($http, CalendarService, $scope){

    this.init = function(){
        var self = this;
        this.daysInMonth = this.getNumberOfDays();
    };

    this.getNumberOfDays = function(m, y) {
    	var numOfDays    = /4|6|9|11/.test(m)?30:m==2?(!(y%4)&&y%100)||!(y%400)?29:28:31;
    	var days         = [];
    	for(var i = 0; i < numOfDays; i++){
    		var d = i + 1;
    		days.push(d);
    	}
    	
        return days;
    };

    this.getToday       = function(date){
        var date        = (typeof date !== 'undefined') ? date : new Date();
        return date.getDate();
    };

    this.paintCalendar  = function($canvas, date){
        var daysInMonth = this.getNumberOfDays(date.getMonth(), date.getUTCFullYear());
        var today       = this.getToday(date);
    };

    this.init();
};

module.exports = CalendarController;
