var CalendarController = function($http, CalendarService){
    this.CalendarService    = CalendarService;
    this.outstanding_todos  = 0;
    this.days               = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

    this.init = function(){
        var self = this;
        this.daysInMonth  = this.getDays();
        this.weeksInMonth = this.getWeeks(this.daysInMonth);
    };

    this.selectDay  = function($event){
      var self      = this;
      var endpoint  = this.CalendarService.constructEndpoint($event);

      $('.today').removeClass('today');
      $($event.target).parent().addClass('today');

      var y = $('.today a').data('year');
      var m = $('.today a').data('month') - 1;
      var d = $('.today a').data('day_index');

      this.setDate($('#daySelector .date'), y, m, d);
      this.update(endpoint, $http);
    };

    /**
     * Sets the date to today unless the y, m, d params are passed. Then it sets it to that date.
     * y: 2000 - 2099
     * m: 0 - 11 where 11 is dec
     * d: day of month
     *
     **/
    this.setDate = function($el, y, m, d){
        var date = (typeof y != 'undefined' && typeof m != 'undefined' && typeof d != 'undefined') ? new Date(y, m, d) : new Date;

        var formatted_date = date.toDateString().split(' ').splice(1, 3).join(', ').replace(',', '', 1);
        $el.html(formatted_date);
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
