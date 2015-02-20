var RegisterController = function($http, $scope){
    this.$http  = $http;
    $scope.reqs = [];

    function isLongEnough(pwd){
        return pwd.length > 4;
    }

    function passwordsMatch(newVal){
        return newVal.length > 4;
    }

    $scope.$watch('user.password2', function(password){
        if(! password) return;
        var pw2 = null;

        if(! passwordsMatch(password, pw2)){
            $scope.reqs.push('Passwords do not match.');
        }

        $scope.showReqs = $scope.reqs2.length;
    });

    $scope.$watch('user.password', function(newVal, oldVal){
        if(! newVal) return;

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