// How to present backend code to frontend
const GoldDigger = require('../public/javascripts/gold_digger')

const gd = new GoldDigger
const prices = gd.prices().then(function(data) {
return data
});

debugger;