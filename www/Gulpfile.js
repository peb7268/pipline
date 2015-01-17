var gulp            = require('gulp'),
    elixir          = require('laravel-elixir'),
    phpunit         = require('gulp-phpunit');
    _jade           = require('gulp-jade');
    //livereload    = require('gulp-livereload');
                    require('laravel-elixir-jade');

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
