var gulp            = require('gulp');
var elixir          = require('laravel-elixir');
var _jade           = require('gulp-jade');
    //livereload    = require('gulp-livereload');
var jade            = require('laravel-elixir-jade');

    elixir(function(mix) {
        mix.jade({
            "baseDir": "./app/views",
            "dest": "/public/",
            "pretty": true,
            "search": "**/*.jade",
            "src": "/jade/"
        });
        mix.sass();
    });

    gulp.task('_jade', function() {
        gulp.src('./public/views/jade/**/*.jade')
            .pipe(_jade({
                pretty: true
            }))
            .pipe(gulp.dest('./public/views/pages'))
    });
