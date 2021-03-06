<!DOCTYPE html>
<html lang="en" ng-app>
  <head>
    <title>Laravel PHP Framework</title>
    <style>@import url(//fonts.googleapis.com/css?family=Lato:700);
      <body>{ margin: 0px; font-family: 'Lato', sans-serif; text-align: center; color: #999; }</body>
      <div class="welcome">{ width: 300px; height: 200px; position: absolute; left: 50%; top: 50%; margin-left: -150px; margin-top: -100px; }</div><a>, a:visited { text-decoration:none; }</a>
      <h1>{ font-size: 32px; margin: 16px 0 0 0; }</h1>
    </style>
    <script src="js/dist/app.js"></script>
  </head>
  <body>
    <div id="App" ng-view>
        @yield('body')
    </div>
  </body>
</html>