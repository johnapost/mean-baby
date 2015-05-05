express = require 'express'
bodyParser = require 'body-parser'
db = require './db'
Post = require './models/post'

app = express()
app.use bodyParser.json()

app.get '/api/posts', (req, res) ->
  Post.find (err, posts) ->
    return next(err) if err
    res.json posts

app.post '/api/posts', (req, res, next) ->
  post = new Post {
    username: req.body.username
    body: req.body.body
  }

  post.save (err, post) ->
    return next(err) if err
    res.status(201).json(post)

app.listen 3000, ->
  console.log 'Server listening on 3000'