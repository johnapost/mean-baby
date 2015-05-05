mongoose = require 'mongoose'

mongoose.connect 'mongodb://localhost/social', ->
  console.log 'mongodb connected'

module.exports = mongoose