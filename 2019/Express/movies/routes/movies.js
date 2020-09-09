var express = require('express');
var router = express.Router();

router.get('/movies', function(req, res, next) {
  res.render('index', {title: 'Movies'});
});

module.exports = router;