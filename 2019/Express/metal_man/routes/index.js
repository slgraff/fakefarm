var express = require('express');
var router = express.Router();
const GoldDigger = require('../public/javascripts/gold_digger')

// visit: 3001

router.get('/3', function (req,res, next) {
  const gd = new GoldDigger();
  gd.scrape2(function(err, data) {
    if(err) return next(err);
    res.set('Content-Type', 'text/html')
    res.send(data);
  })

})

// 3. Merge template and http call
router.get('/', function(req, res, next) {
  const title = 'Metal Man'

  const gd = new GoldDigger();
  gd.scrape2(function(err, data) {
    if(err) return next(err);
    res.render('index', {title: title, prices: data});
  })


});


// 2. Why does async await work,
// how can I get this to work with promises?
router.get('/2', async function(req, res, next) {
  const gd = new GoldDigger
  let prices2 = await gd.prices();
  res.set('Content-Type', 'text/html')
  res.send(prices2);
});

// 1. why won't this work?
// router.get('/1', function(req, res, next) {
//   const gd = new GoldDigger
//   const prices = gd.prices().then(function(data) {
//   return data
//   }) || 'blah!!'
//   const title = 'Metal Man'
//   res.render('index', {prices: prices, title: title});
// });


module.exports = router;
