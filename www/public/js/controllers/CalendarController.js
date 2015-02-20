var CalendarController = function($http, CalendarService){
    this.CalendarService    = CalendarService;
    this.outstanding_todos  = 0;

    this.init = function(){
        var self = this;
        this.daysInMonth = this.getDays();
    };

    this.selectDay  = function($event){
      var self      = this;
      var endpoint  = this.CalendarService.constructEndpoint($event);

      $('.today').removeClass('today');
      $($event.target).parent().addClass('today');
      this.update(endpoint, $http);
    };

    this.update = function(endpoint, $http){
        var self      = this;
        this.CalendarService.fetch(endpoint, $http).success(function(data){
            self.CalendarService.setItems(data);
        });
    };

    /**
     * Returns an array of day objects
     **/
    this.getDays = function(m, y) {
        var date         = new Date;
    	var numOfDays    = /4|6|9|11/.test(m)?30:m==2?(!(y%4)&&y%100)||!(y%400)?29:28:31;
    	var days         = [];

        for(var i = 0; i < numOfDays; i++){
            var day = {
                day : i + 1,
                month: date.getMonth() + 1,
                year: date.getUTCFullYear()
            };

    		days.push(day);
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
