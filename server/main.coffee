express = require 'express'
bodyParser = require 'body-parser'
db = require './db'
jwt = require 'jwt-simple'
bcrypt = require 'bcrypt'
_ = require 'lodash'

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

# Authentication
secretKey = 'superSecretKey'
users = [
  {
    username: 'japostol'
    password: '$2a$10$XgXDczlJ3p3HXxCzT4BxSeBfO1XXZjbeZUXLDuR7i7nDfShHkFbFK'
  }
]

findUserByUsername = (username) ->
  _.find users, username: username

validateUser = (user, password, callback) ->
  bcrypt.compare password, user.password, callback

app.post '/session', (req, res) ->
  user = findUserByUsername req.body.username

  validateUser user, req.body.password, (err, valid) ->
    return res.sendStatus 401 if err or not valid
    token = jwt.encode {username: user.username}, secretKey
    res.json token

app.get '/user', (req, res) ->
  token = req.headers['x-auth']
  user = jwt.decode token, secretKey
  # TODO: pull user info from database
  res.json user

# Start API server
app.listen 3000, ->
  console.log 'Server listening on :3000'