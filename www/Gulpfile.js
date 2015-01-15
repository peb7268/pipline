var gulp          = require('gulp'),
    plumber       = require('gulp-plumber'),
    rename        = require('gulp-rename'),
    elixir        = require('laravel-elixir'),
    //behat         = require('gulp-behat'),
    phpunit       = require('gulp-phpunit'),
    notify        = require('gulp-notify'),
    livereload    = require('gulp-livereload'),
    sass          = require('gulp-sass'),
    sys           = require('sys'),
    exec          = require('child_process').exec,
    //require('laravel-elixir-jade');
    jade          =  require('gulp-jade');

    elixir(function(mix) {
        //mix.jade({
        //    "baseDir": "./app/views",
        //    "dest": "/public/",
        //    "pretty": true,
        //    "search": "**/*.jade",
        //    "src": "/jade/"
        //});
        mix.sass();
    });

    gulp.task('jade', function() {
        gulp.src('./public/views/jade/**/*.jade')
            .pipe(jade({
                pretty: true
            }))
            .pipe(gulp.dest('./public/views/pages'))
    });

//gulp.task('behat', function() {
//    var options = {debug: false};
//    return gulp.src('behat.yml')
//        .pipe(plumber())
//        .pipe(behat('', options))
//});
//
//gulp.task('current_phpunit_file', function() {
//    exec('phpunit app/tests/phpunit/unit/UserTest.php --verbose', function(error, stdout) {
//        sys.puts(stdout);
//    });
//});
//
//gulp.task('clear', function() {
//    exec('clear', function(error, stdout) {
//        sys.puts(stdout);
//    });
//});
//
//gulp.task('phpunit', function(){
//    var options = {
//        debug: false,
//        clear: true,
//        testClass: 'app/tests/phpunit/functional/ExportServiceTest.php'
//    };
//
//    return gulp.src('phpunit.xml')
//        .pipe(plumber())
//        .pipe(phpunit('', options))
//        .on('error', notify.onError({
//            title: "Testing Failed",
//            message: "Error(s) occurred during testing..."
//        }));
//});
