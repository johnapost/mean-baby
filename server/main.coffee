express = require 'express'
bodyParser = require 'body-parser'
db = require './db'

allowCrossDomain = (req, res, next) ->
  res.header 'Access-Control-Allow-Origin', 'http://192.168.1.11:4000'
  res.header 'Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE'
  res.header 'Access-Control-Allow-Headers', 'Content-Type'
  next()

# Define App
app = express()
app.use bodyParser.json()
app.use allowCrossDomain

# Routes
app.use '/api/posts', require './controllers/posts'

# Start API server
app.listen 3000, ->
  console.log 'Server listening on :3000'