var gulp            = require('gulp');
var elixir          = require('laravel-elixir');
var jade            = require('laravel-elixir-jade');   //Does the blade jade
require('laravel-elixir-browserify');

var paths = {
    jade: './public/views/jade/**/*.jade',
    views: './public/views/pages',
    scripts: './public/js/**/*.js',
    sass: 'public/sass/**/*.scss'
};

gulp.task('_jade', function() {
    gulp.src(paths.jade)
        .pipe(_jade({
            pretty: true
        }))
        .pipe(gulp.dest(paths.views))
});

elixir(function(mix) {
    mix.jade({
        "baseDir": "./app/views",
        "dest": "/public/",
        "pretty": true,
        "search": "**/*.jade",
        "src": "/jade/"
    })
    mix.jade({
        "baseDir": "./public/views",
        "dest": "/pages/",
        "pretty": true,
        "blade": false,
        "search": "**/*.jade",
        "src": "/jade/"
    })
    .sass()
    .browserify("public/js/app.js",{
        debug: true,
        insertGlobals: true,
        output: "public/js/dist",
        rename: 'bundle.js'
    });
});

