db = require '../db'

User = db.model 'User', {
  username:
    type: String
    required: true
  password:
    type: String
    select: false
}

module.exports = User