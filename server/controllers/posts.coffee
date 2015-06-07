Post = require '../models/post'
router = require('express').Router()

router.get '/', (req, res) ->
  Post.find().sort('-date').exec (err, posts) ->
    return next(err) if err
    res.json posts

router.post '/', (req, res, next) ->
  post = new Post {
    username: req.auth.username
    body: req.body.body
  }

  post.save (err, post) ->
    return next(err) if err
    res.status(201).json post

module.exports = router
