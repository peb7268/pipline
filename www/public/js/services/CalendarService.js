var CalendarService = function($http){
    var items   = [];
    var self    = this;
    var evt;

    var user_id = App.user.id;
    var year    = getYear(evt, window.location);
    var month   = getMonth(evt, window.location);
    var day     = getDay(evt, window.location);

    var endpoint =  constructEndpoint();

    var request = $http.get(endpoint);

    /***
    * Constructs an endpoint for fetching todos
     * params window.location, evt
    * */
    function constructEndpoint(event, loc){
        var endpoint         = '/api/v1/todos';
        if(typeof user_id   != undefined) endpoint += '/' + user_id;
        if(typeof year      != undefined) endpoint += '/' + year;
        if(typeof month     != undefined) endpoint += '/' + month;
        if(typeof day       != undefined) endpoint += '/' + day;

        console.log(endpoint);
        debugger;
        return endpoint;
    };

    function retrieveDateFromUrl(loc, part){
        var part;

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
        if(typeof evt != 'undefined' && evt.type == 'click') day = retrieveDateFromEvent(evt, 'day');
        day = new Date().getUTCDate();
        if(typeof day == 'undefined'){ throw new Error('Oops, Couldn\'t resolve month.'); return false; }

        return day;
    }

    return {
        req: request,
        items: function(){
            return items;
        }
    };
};

module.exports = CalendarService;
