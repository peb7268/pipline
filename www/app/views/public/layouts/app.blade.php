<!DOCTYPE html>
<html lang="en" ng-app="App">
  <head>
    <title>Laravel PHP Framework</title>
    <link href="./css/styles.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  </head>
  <body>
    <div id="App" ng-view>@yield('body')</div>
    <script src="./node_modules/angular/angular.js"></script>
    <script src="./node_modules/angular-route/angular-route.js"></script>
    <script src="./js/dist/app.js"></script>
  </body>
</html>