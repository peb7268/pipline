var CalendarService = function($http){
    var items = [];
    var self  = this;

    var request = $http.get('/api/v1/todos');

    return {
        req: request,
        items: function(){
            return items;
        }
    };
};

module.exports = CalendarService;
