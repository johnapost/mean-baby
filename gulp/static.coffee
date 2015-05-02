gulp = require 'gulp'
changed = require 'gulp-changed'
concat = require 'gulp-concat'
uglify = require 'gulp-uglifyjs'
minifycss = require 'gulp-minify-css'
config = require './config.coffee'

gulp.task 'vendor', ->
  gulp.src [
    'bower_components/modernizr/modernizr.js'
    'bower_components/jquery/dist/jquery.min.js'
    'bower_components/angular/angular.min.js'
    'bower_components/velocity/velocity.min.js'
    'bower_components/velocity/velocity.ui.min.js'
  ]
  .pipe changed "#{config.path}/scripts"
  .pipe uglify()
  .pipe concat 'vendor.js'
  .pipe gulp.dest "#{config.path}/scripts"

module.exports = gulp