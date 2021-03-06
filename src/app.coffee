# Create angular app
app = angular.module 'meanBaby', ['ui.router', 'btford.socket-io']

# Make Modernizr injectable
app.constant 'Modernizr', Modernizr

# Create console.log for incompatible browsers
window.console = window.console or {}
window.console.log = window.console.log or ->

# Empty anchor links go nowhere
$ ->
  $("a[href='#']").click (e) ->
    e.preventDefault()
