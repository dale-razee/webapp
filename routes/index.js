var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  const appVersion = process.env.APP_VERSION || '';
  const version = 'https://github.com/dale-razee/webapp/commit/' + appVersion;
  res.render('index', { title: 'Webapp', version: version, build: build });
});

module.exports = router;
