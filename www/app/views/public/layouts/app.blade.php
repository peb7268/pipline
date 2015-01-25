<!DOCTYPE html>
<html lang="en" ng-app="App">
  <head>
    <title>Laravel PHP Framework</title>
    <link href="./css/styles.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="./js/dist/app.js"></script>
  </head>
  <body ng-controller="AppController as AppCtrl">
    <div id="App" ng-view>@yield('body')</div>
  </body>
</html>