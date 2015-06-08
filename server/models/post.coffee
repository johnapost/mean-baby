db = require '../db'
Schema = require('mongoose').Schema

Post = db.model 'Post', {
  _user:
    type: Schema.Types.ObjectId
    ref: 'User'
    required: true
  body:
    type: String
    required: true
  date:
    type: Date
    required: true
    default: Date.now
}

module.exports = Post
