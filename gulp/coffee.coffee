gulp = require 'gulp'
cache = require 'gulp-cached'
debug = require 'gulp-debug'
newer = require 'gulp-newer'
remember = require 'gulp-remember'
sourcemaps = require 'gulp-sourcemaps'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
chmod = require 'gulp-chmod'
annotate = require 'gulp-ng-annotate'
uglify = require 'gulp-uglify'
config = require './config.coffee'

errorHandler = (error) ->
  console.log error.toString()
  this.emit 'end'

gulp.task 'coffee', ->
  gulp.src 'src/**/*.coffee'
    .pipe newer "#{config.path}/scripts/app.js"
    .pipe sourcemaps.init()

    .pipe coffee(bare: true)
    .on 'error', errorHandler
    .pipe remember 'coffee'
    .pipe concat('app.js')
    .pipe chmod 755

    .pipe sourcemaps.write()
    .pipe gulp.dest("#{config.path}/scripts")

gulp.task 'coffeeProduction', ->
  gulp.src 'src/**/*.coffee'

    .pipe coffee(bare: true)
    .on 'error', errorHandler
    .pipe remember 'coffee'
    .pipe concat('app.js')
    .pipe annotate()
    .pipe uglify()
    .pipe chmod 755

    .pipe gulp.dest("#{config.path}/scripts")

module.exports = gulp