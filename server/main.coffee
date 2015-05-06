express = require 'express'
bodyParser = require 'body-parser'
db = require './db'
Post = require './models/post'

allowCrossDomain = (req, res, next) ->
  res.header 'Access-Control-Allow-Origin', 'http://192.168.1.11:4000'
  res.header 'Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE'
  res.header 'Access-Control-Allow-Headers', 'Content-Type'
  next()

app = express()
app.use bodyParser.json()
app.use allowCrossDomain

app.get '/api/posts', (req, res) ->
  Post.find().sort('-date').exec (err, posts) ->
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