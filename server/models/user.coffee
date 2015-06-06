db = require '../db'

User = db.model 'User', {
  username:
    type: String
    required: true
  password:
    type: String
    required: true
    select: false
}

module.exports = User
