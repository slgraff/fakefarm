const GoldDigger = require('../public/javascripts/gold_digger')

describe('GoldDigger', () => {
  it('calls the endpoint', () => {
    gd = new GoldDigger;
    const prices = gd.prices()
    expect(prices).toBe('boom')
  });

  it('private call api', () => {
    gd = new GoldDigger;
    const content = gd.scrape()
    expect(content).toBe('boom')
  });
})