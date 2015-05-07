What is Mean Baby?
==================

Mean Baby is my first full foray into the MEAN stack (MongoDB, ExpressJS, AngularJS, NodeJS).

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

Front end tests are done with Protractor. Back end tests TBD.

Contributing
------------

Feel free to fork. I don't expect to maintain this project.