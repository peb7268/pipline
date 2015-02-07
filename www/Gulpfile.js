var gulp            = require('gulp');
var elixir          = require('laravel-elixir');

require('laravel-elixir-jade');
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
    //mix.jade({
    //    "baseDir": "./app/views",
    //    "dest": "/public/",
    //    "pretty": true,
    //    "search": "**/*.jade",
    //    "blade": true,
    //    "src": "/jade/"
    //})
    mix.sass()
    .browserify("public/js/app.js",{
        debug: true,
        insertGlobals: true,
        output: "public/js/dist",
        rename: 'bundle.js'
    });

    //FE Jade, can only have be or fe uncommented at once.
    mix.jade({
        "baseDir": "./public/views",
        "dest": "/pages/",
        "pretty": true,
        "blade": false,
        "search": "**/*.jade",
        "src": "/jade/"
    });
});

