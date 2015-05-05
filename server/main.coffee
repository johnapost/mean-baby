express = require 'express'
bodyParser = require 'body-parser'
db = require './db'
Post = require './models/post'

app = express()
app.use bodyParser.json()

app.get '/api/posts', (req, res) ->
  res.json [
    {
      username: 'johnapost'
      body: 'Node rocks!'
    }
  ]

app.post '/api/posts', (req, res, next) ->
  post = new Post {
    username: req.body.username
    body: req.body.body
  }

  post.save (err, post) ->
    return next(err) if err
    res.json 201, post

app.listen 3000, ->
  console.log 'Server listening on 3000'