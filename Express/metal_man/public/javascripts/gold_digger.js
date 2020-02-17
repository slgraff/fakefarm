const https = require('https');
const ENDPOINT = 'https://integration.nfusionsolutions.biz/client/silverdoctors/module/spotheader'

class GoldDigger {
  prices() {
    // debugger;
    return this.scrape()
  }

  scrape2(cb) {
    https.get(ENDPOINT, (res) => {
      res.on('data', (d) => {
        return cb(null, d)
      });
    }).on('error', (e) => {
      return cb(e)
    });
  }

  scrape() {
    return new Promise(function (resolve, reject) {
    https.get(ENDPOINT, (res) => {
      res.on('data', (d) => {
        return resolve(d)
      });
    }).on('error', (e) => {
      return reject(e)
    });
    })
  }
}

module.exports = GoldDigger;