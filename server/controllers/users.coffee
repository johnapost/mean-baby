User = require '../models/user'
router = require('express').Router()
bcrypt = require 'bcrypt'
jwt = require 'jwt-simple'
secretKey = 'superSecretKey'

router.post '/', (req, res, next) ->
  user = new User username: req.body.username

  bcrypt.hash req.body.password, 10, (err, hash) ->
    user.password = hash
    user.save (err, user) ->
      throw next err if err
      res.send 201

router.get '/', (req, res) ->
  token = req.headers['x-auth']
  auth = jwt.decode token, secretKey
  User.findOne username: auth.username, (err, user) ->
    res.json user

module.exports = router