var AgendaController = function($http, $scope){
    this.$http  = $http;
    this.items  = [];

    this.init = function(){
        var self = this;

        self.setDate($('#daySelector > ul li.date'))
        self.$http.get('/api/v1/todos')
            .success(function(data, status, headers, config) {
                self.items = data;
            })
            .error(function(data, status, headers, config) {
                console.error(status, data);
        });
    };

    this.setDate = function($el){
        var date = new Date();
        var formatted_date = date.toDateString().split(' ').splice(1, 3).join(', ').replace(',', '', 1);

        $el.html(formatted_date);
    };

    this.toggleItemControls = function(){
        var self = this;
        event.preventDefault();
        var $parent = $(event.target).parent();

        if(event.target.nodeName == 'A' && $parent.hasClass('completed')) $parent.removeClass('completed');

        var $el         = $(event.target);
        var $controls   = $el.parent().parent().find('#controls');

        if($controls.length == 0) $controls = $($('#controlsTemplate').clone().html().trim());
        if($el.parent().find('.controls').length == 0) $el.parent().append($controls);

        $controls.slideToggle(100);
    };

    this.addTodo  = function(){
        var self = this;
        if(event.which != 13) return false;
        var $el         = $(event.target);
        var item        = { title: $el.val(), status: 0 };

        this.items.push(item);
        $el.val('');

        self.$http.post('/api/v1/todos', item)
            .success(function(data, status, headers, config) {
                console.log(status, data);
            })
            .error(function(data, status, headers, config) {
                console.log(status, data);
        });
    };

    this.deleteTodo  = function(id){
        var self = this;

        self.$http.delete('/api/v1/todos/' + id)
            .success(function(data, status, headers, config) {
                console.log(status, data);
            })
            .error(function(data, status, headers, config) {
                console.log(status, data);
            });
    };

    this.setTodoFinished = function(){
        var self        = this;
        var $el         = $(event.target);
        var $item       = $el.parent().parent();
        var isCompleted = $item.hasClass('completed');

        if(! isCompleted){
            $item.addClass('completed');
            if($('#controls').is(':visible')) self.toggleItemControls();
        }
        if(isCompleted){
            $item.fadeOut(100, function(){
                var id = $(this).data('id');
                self.items.splice(id, 1);
                $(this).remove();
                self.deleteTodo(id);
            });
        }
    };

    this.updateSet = function(items){
        var self = this;

        console.log('updating set', items);
        self.$http.post('/api/v1/todos', items)
            .success(function(data, status, headers, config) {
                console.log(status, data);
            })
            .error(function(data, status, headers, config) {
                console.log(status, data);
        });
    };

    this.init();
};

module.exports = AgendaController;