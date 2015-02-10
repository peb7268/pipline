var RegisterController = function($http, $scope){
    this.$http  = $http;

    function isLongEnough(pwd){
        return pwd.length > 4;
    }

    $scope.$watch('user.password', function(newVal, oldVal){
        if(! newVal) return;

        $scope.reqs = [];

        if(! isLongEnough(newVal)){
            $scope.reqs.push('Password is too short.')
        }

        $scope.showReqs = $scope.reqs.length;
    });

    this.submitForm = function(){
      var self    = this;
      self.el     = event.target;

      this.$http.post('/api/v1/users', this.user)
          .success((function(self){
             $(self.el).find('input').val('');
              $('<p />', {
                  class: 'success',
                  text: 'Welcome to the club. Carpe Diem.',
                  style: 'display: none;'
              }).insertAfter($(self.el).parent().find('.title'));

              $('p.success').fadeIn(100, function(){
                  var timerId = window.setTimeout(function(){
                      $('p.success').fadeOut(100, function() {
                          window.location.hash = 'home';
                      });
                  }, 2500);
              });

             return function(data, status, headers, config){
                 console.log(data);
             }
          })(self))
          .error(function(data, status, headers, config){
             console.error(status, data);
             return data;
          });
    };
};

module.exports = RegisterController;