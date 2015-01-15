var appControllers = angular.module('appControllers', []);

appControllers.controller('AppCtrl', ['$scope',
    function($scope){
        console.log('AppCtrl');
}]);

appControllers.controller('LoginCtrl', ['$scope',
    function($scope){
        console.log('LoginCtrl');
}]);

appControllers.controller('RegisterCtrl', ['$scope',
    function($scope){
        console.log('RegisterCtrl');
}]);

module.exports = appControllers;
