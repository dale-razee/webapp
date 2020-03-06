var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  const appVersion = process.env.APP_VERSION || '';
  res.render('index', { title: 'Webapp-test', version: appVersion });
});

module.exports = router;
