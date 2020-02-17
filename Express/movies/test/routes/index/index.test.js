const request = require('supertest');
const app = require('../../../app');

describe('Index', () => {
  afterAll(done => {
    app.close(err => {
      if(err) return done(err);
      console.log('Test server closed');
      done();
    });
  });
  describe('Get Index list', () => {
    it('should return 200', done => {
      request(app)
        .get('/')
        .expect(200)
        .end(done)
    });
  });
});