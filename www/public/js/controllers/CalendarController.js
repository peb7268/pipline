var CalendarController = function($http, CalendarService){
    this.CalendarService    = CalendarService;
    this.outstanding_todos  = 0;
    this.days               = [{name: 'Monday'}, {name: 'Tuesday'}, {name: 'Wednesday'}, {name: 'Thursday'}, {name: 'Friday'}, {name: 'Saturday'}];

    this.init = function(){
        var self = this;
        this.daysInMonth  = this.getDays();
        this.weeksInMonth = this.getWeeks(this.daysInMonth);
        console.log('weeks in month: ', this.weeksInMonth);
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
     * Returns an array of day objects for each day in the month
     **/
    this.getDays = function(m, y){
        var date         = new Date;
        var m            = m || date.getMonth() + 1;
        var y            = y || date.getUTCFullYear();
    	var numOfDays    = new Date(y, m, 0).getDate();

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

    /**
     * Returns an array of arrays each containing a week of the month
     **/
    this.getWeeks   = function(daysInMonth){
      var weeks     = [];
      var week      = [];

      for(var day = 0; day < daysInMonth.length; day++){
        week.push(daysInMonth[day]);
        //console.log('day: ', day);

        //Every 7 days push a week onto the array and start with a fresh week.
        if((day + 1) % 7 == 0) {
            //console.log('week ended: ', (day + 1) % 7 == 0);
            //console.log("\n\n");

            weeks.push(week);
            week  = [];
        }

        //If its the last week start a new week
        if((daysInMonth.length - day) < 8){}

        //After / on the last day push the accumulated week onto the weeks array.
        if((daysInMonth.length == (day - 1))){
          weeks.push(week);
        }
      }

      return weeks;
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
