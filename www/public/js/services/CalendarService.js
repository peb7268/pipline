var CalendarService = function($http){
    var evt;

    var user_id;
    var year;
    var month;
    var day;

    var endpoint;
    var request;
    this.items    = [];

    /***
    * Constructs an endpoint for fetching todos
     * params window.location, evt
    * */
    function constructEndpoint(evt, loc){
        var endpoint         = '/api/v1/todos';

        if(typeof user_id   != undefined) endpoint += '/' +  App.user.id;
        if(typeof year      != undefined) endpoint += '/' +  getYear(evt, window.location);
        if(typeof month     != undefined) endpoint += '/' +  getMonth(evt, window.location);
        if(typeof day       != undefined) endpoint += '/' +  getDay(evt, window.location);

        return endpoint;
    };

    function addTodo(event){
        var self        = this;
        var $el         = $(event.target);

        //Set a YMD for new created items.
        var $today      = $('.today a');
        var day         = $today.data('day_index');
        var month       = $today.data('month');
        var year        = $today.data('year');

        var item        = { title: $el.val(), status: 0, day: day, month: month, year: year, user_id: App.user.id };

        this.items.push(item);
        $el.val('');

        $http.post('/api/v1/todos', item)
        .success(function(data, status, headers, config) {
                console.log(status, data);
            })
        .error(function(data, status, headers, config) {
                console.log(status, data);
            });
    };

    /**
     * Sets the entire items model
     */
    function setItems(items){
      this.items = items;
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
                part = ($(evt.target).data('day_index'));
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
    function fetchDayData(endpoint, $http){
        return $http.get(endpoint);
    }

    function init(){
        var self = this;
        endpoint = constructEndpoint();
        request  = fetchDayData(endpoint, $http);

        request.success(function(data, status, headers, config){
            self.items = data;
        })
        .error(function(data, status, headers, config) {
            console.error(status, data);
        });

        return request;
    };
    
    return {
        init: init,
        items: this.items,
        setItems: setItems,
        addTodo: addTodo,
        fetch: fetchDayData,
        constructEndpoint: constructEndpoint
    };
};

module.exports = CalendarService;
