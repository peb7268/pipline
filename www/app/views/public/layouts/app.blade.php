<!DOCTYPE html>
<html lang="en" ng-app="App">
  <head>
    <title>Pipeline | Elevate your time management</title>
    <link href="./css/styles.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <script src="./js/dist/bundle.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <base href="/">
  </head>
  <body ng-controller="AppController as AppCtrl">
    <ui-view>
        @yield('body')
    </ui-view>
  </body>
</html>