What is Mean Baby?
==================

Mean Baby is my first full foray into the MEAN stack (MongoDB, ExpressJS, AngularJS, NodeJS). I am working off of [Write Modern Web Apps with the MEAN Stack](http://www.amazon.com/Write-Modern-Apps-MEAN-Stack/dp/0133930157) by [Jeff Dickey](https://twitter.com/dickeyxxx).

I deviate from the book a bit, especially when it comes to AngularJS since I already write my Angular apps a certain way.

Getting Started
---------------

    npm install
    gulp

Directory Structure
-------------------

    root
    |-dist
    |-gulp
    |-server
    | |-controllers
    | |-models
    | |-auth.coffee
    | |-config.coffee
    | |-db.coffee
    | |-main.coffee
    | `-server.js
    `-src
      |-components
      | `-component
      |   |-component.coffee
      |   |-component.jade
      |   `-component.scss
      |-partials
      | `-head.jade
      |-views
      | `-index.jade
      |-_mixins.scss
      |-app.coffee
      `-app.scss

Tests
-----

I don't have tests in this project yet but this is what's planned:

Simply ```npm test``` in order to run the suite.

* Client unit tests: Karma and Jasmine
* Server unit tests: TBD
* E2E tests: NightwatchJS

Contributing
------------

Feel free to fork. I don't expect to maintain this.
