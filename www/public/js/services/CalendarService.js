var CalendarService = function($http){
    var items   = [];
    var self    = this;
    var evt;

    var user_id;
    var year;
    var month;
    var day;

    var endpoint;
    var request;


    /***
    * Constructs an endpoint for fetching todos
     * params window.location, evt
    * */
    self.constructEndpoint = function(evt, loc){
        var endpoint         = '/api/v1/todos';

        if(typeof user_id   != undefined) endpoint += '/' +  App.user.id;
        if(typeof year      != undefined) endpoint += '/' +  getYear(evt, window.location);
        if(typeof month     != undefined) endpoint += '/' +  getMonth(evt, window.location);
        if(typeof day       != undefined) endpoint += '/' +  getDay(evt, window.location);

        return endpoint;
    };

    function retrieveDateFromEvent(evt, part){
        var part;

        switch(part){
            case 'year':
               part = $(evt.target).data('year');
            break

            case 'month':
                part = $(evt.target).data('month');
            break

            case 'day':
                part = ($(evt.target).data('day_index') + 1);
            break
        }

        return part;
    }

    function retrieveDateFromUrl(loc, part){
        var part;
        console.log('retrieveDateFromUrl:part', part);

        switch(part){
            case 'year':
                debugger;
            break
        }

        return part;
    }

    /**
     * Get the year from the event if a click occurred else get the current year.
     */
    function getYear(evt){
        var year;
        if(typeof evt != 'undefined' && evt.type == 'click') year = retrieveDateFromEvent(evt, 'year');
        year = new Date().getUTCFullYear();
        if(typeof year == 'undefined') { throw new Error('Oops, Couldn\'t resolve year.'); return false; }

        return year;
    }

    function getMonth(evt){
        var mo;
        if(typeof evt != 'undefined' && evt.type == 'click') mo = retrieveDateFromEvent(evt, 'month');
        mo = (new Date().getUTCMonth() + 1);
        if(typeof mo == 'undefined'){ throw new Error('Oops, Couldn\'t resolve month.'); return false; }

        return mo;
    }

    function getDay(evt){
        var day;
        if(typeof evt != 'undefined' && evt.type == 'click') {
            day = retrieveDateFromEvent(evt, 'day');
        } else {
            day = new Date().getUTCDate();
        }

        if(typeof day == 'undefined'){ throw new Error('Oops, Couldn\'t resolve month.'); return false; }

        return day;
    }

    /*
    * Fetches data for a day based off of the endpoint
    */
    this.fetchDayData = function(endpoint, $http){
        return $http.get(endpoint);
    }

    endpoint = this.constructEndpoint();
    request  = this.fetchDayData(endpoint, $http);

    return {
        req: request,
        items: function(){
            return items;
        },
        setItems: function(newItems){
            items = newItems;
        },
        fetch: this.fetchDayData,
        constructEndpoint: this.constructEndpoint
    };
};

module.exports = CalendarService;
