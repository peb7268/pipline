define([], function(){
    var calendar;

    return function calendarHelper(){
        calendar = this;
        this.day_names   = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
        this.month_names = ["Janrurary", "Februrary", "March", "April", "May", "June", "July", "Agust", "September", "October", "November", "December"];
        this.prev = {};
        this.current = {
            first_day: new Date(d.getFullYear(), d.getMonth(), 1).getDay(),
            days_of_month: 0,
            today: d.getDay(),
            selected_day: 0,
            day_name: '',
            year: d.getFullYear(),
            month: d.getMonth()
        };
        this.next = {};

        this.isToday = function(day){
            return (day == this.current.today) ? 'today' : '';
        };

        this.lookupNameOfDay = function(day){
            return day % calendar.day_names.length;
        };

        this.setDaysInMonth = function(){
            var num_days = new Date(calendar.current.year, calendar.current.month, 0).getDate();
            calendar.current.days_of_month = _.range(1, num_days)
        };

        this.setDay = function(day){
            calendar.current.day_name = calendar.day_names[day];
        };

        this.setSelectedDay = function(day){
            calendar.current.selected_day = day || calendar.current.today;
            calendar.selectDay(null, calendar.current.selected_day);
        };

        this.incrementDay = function(day, step){
            calendar.current.selected_day = (typeof step !== 'undefined') ? calendar.current.selected_day + step : calendar.current.selected_day + 1;
            this.setSelectedDay(calendar.current.selected_day);
        };

        this.selectDay = function(e, day){
            $('.today').removeClass('today');
            if(typeof day == 'undefined'){
                $(e.target).toggleClass('today');
            } else {
                if (day) {
                    $('.day').eq(day).toggleClass('today');
                }
            }
        };

        this.resetDay = function(e){
            $('.today').removeClass('today');
            $('.day').eq(calendar.current.today - 1).addClass('today');
        };
    }
});
