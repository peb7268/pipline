#App build instructions
Both the blade and the public views are built with Jade.
To run the jade compiler for laravel just run laravel elixir by running gulp or gulp watch.
To comiple the public view templates run gulp _jade.

When you are ready to package up the JavaScript for the app just run watchify / browserify to concat the
front end scripts into a browser bundle. Currently the browser bundle is in js/dist/app.js. The command to
generate it is:

watchify --entry public/js/app.js --outfile public/dist/app.js