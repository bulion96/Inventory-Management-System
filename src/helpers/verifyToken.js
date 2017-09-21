// const cookie = require('cookie');
const jwt = require('jsonwebtoken');
// const bcrypt = require('bcrypt');
require('env2')('config.env');

const verifyToken = (token, cb) => {
  jwt.verify(token, process.env.SECRET, (err, decoded) => {
    if (err) {
      cb(err);
    } else {
      cb(null, decoded);
    }
  });
};

module.exports = {
  verifyToken
};
