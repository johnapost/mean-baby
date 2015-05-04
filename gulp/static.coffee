gulp = require 'gulp'
newer = require 'gulp-newer'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
merge = require 'merge-stream'
minifycss = require 'gulp-minify-css'
config = require './config.coffee'

gulp.task 'vendor', ->
  js = gulp.src [
    'bower_components/modernizr/modernizr.js'
    'bower_components/jquery/dist/jquery.min.js'
    'bower_components/angular/angular.min.js'
    'bower_components/velocity/velocity.min.js'
    'bower_components/velocity/velocity.ui.min.js'
    'bower_components/bootstrap/dist/js/bootstrap.min.js'
  ]
  .pipe newer "#{config.path}/scripts"
  .pipe uglify()
  .pipe concat 'vendor.js'
  .pipe gulp.dest "#{config.path}/scripts"

  css = gulp.src [
    'bower_components/bootstrap/dist/css/bootstrap.min.css'
  ]
  .pipe newer "#{config.path}/styles"
  .pipe minifycss()
  .pipe concat 'vendor.css'
  .pipe gulp.dest "#{config.path}/styles"

module.exports = gulp