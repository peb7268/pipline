
var HomeController = function($scope){
    var self = this;

    $scope.init = function(){
        var self = this;
    };

    self.items = [
        {title: "Wipe down the office", status: 1},
        {title: "Buy Czara food", status: 0},
        {title: "Go to office tomorrow", status: 0}
    ];

    self.toggleItemControls = function(){
        var self = this;
        event.preventDefault();
        var $el         = $(event.target);
        var $controls   = $el.parent().parent().find('#controls');

        if($controls.length == 0) $controls = $($('#controlsTemplate').clone().html().trim());
        if($el.parent().find('.controls').length == 0) $el.parent().append($controls);

        $controls.slideToggle(100);
    };

    self.addTodo  = function(){
        var self = this;
        if(event.which != 13) return false;
        var $el         = $(event.target);
        var item        = { title: $el.val(), status: 0 };

        this.items.push(item);
        $el.val('');
    };

    self.toggleStatus = function(){
        var self        = this;
        var $el         = $(event.target);
        var $item       = $el.parent().parent();
        var isCompleted = $item.hasClass('completed');

        if(! isCompleted){
            $item.addClass('completed');
            $strike = $('<span />', { class: 'strike'});
            $item.append($strike);
            $strike.animate({
                width: '90%'
            });
        }
        if(isCompleted){
            $item.fadeOut(100, function(){
                var id = $(this).data('id');
                self.items.splice(id, 1);
                $(this).remove();
                self.updateSet(self.items);
            });
        }
    };

    self.updateSet = function(items){
        var self = this;
        console.log('updating set', items);
    };

    $scope.init();
};

module.exports = HomeController;