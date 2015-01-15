<!DOCTYPE html>
<html lang="en" ng-app="App">
  <head>
    <title>Laravel PHP Framework</title>
    <style>@import url(//fonts.googleapis.com/css?family=Lato:700);
      <body>{ margin: 0px; font-family: 'Lato', sans-serif; text-align: center; color: #999; }</body>
      <div class="welcome">{ width: 300px; height: 200px; position: absolute; left: 50%; top: 50%; margin-left: -150px; margin-top: -100px; }</div><a>, a:visited { text-decoration:none; }</a>
      <h1>{ font-size: 32px; margin: 16px 0 0 0; }</h1>
    </style>
  </head>
  <body>
    <div id="App" ng-view></div>

    <script src="../node_modules/angular/angular.js"></script>
    <script src="../node_modules/angular-route/angular-route.js"></script>
    {{--<script src="./js/controllers/AppController.js"></script>--}}
    <script src="./js/dist/app.js"></script>
  </body>
</html>