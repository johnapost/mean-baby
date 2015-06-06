express = require 'express'
bodyParser = require 'body-parser'
jwt = require 'jwt-simple'
bcrypt = require 'bcrypt'
_ = require 'lodash'

allowCrossDomain = (req, res, next) ->
  # res.header 'Access-Control-Allow-Origin', 'http://localhost:4000'
  res.header 'Access-Control-Allow-Origin', '*'
  res.header 'Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE'
  res.header 'Access-Control-Allow-Headers', 'Content-Type'
  next()

# Define App
app = express()
app.use bodyParser.json()
app.use allowCrossDomain

# Routes
app.use '/api/posts', require './controllers/posts'
app.use '/api/users', require './controllers/users'

# Authentication
findUserByUsername = (username) ->
  _.find users, username: username

app.post '/session', (req, res) ->
  user = findUserByUsername req.body.username

  User.findOne username: req.body.username
  .select 'password'
  .exec (err, user) ->
    return next err if err
    return res.sendStatus 401 unless user
    bcrypt.compare req.body.password, user.password, (err, valid) ->
      return next err if err
      return res.sendStatus 401 unless valid
      token = jwt.encode username: user.username, secretKey
      res.json token

# Start API server
app.listen 3000, ->
  console.log 'Server listening on :3000'
