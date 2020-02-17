const request = require('supertest');
const app = require('../../../app');

describe('Movies', () => {
  afterAll(done => {
    app.close(err => {
      if(err) return done(err);
      console.log('Test server closed');
      done();
    });
  });
  describe('Get Movie list', () => {
    it('should return 200', done => {
      request(app)
        .get('/movies')
        .expect(200)
        .end(done)
    });
  });
});