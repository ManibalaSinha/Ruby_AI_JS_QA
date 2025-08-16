// tests/mocha/backend.test.js
const request = require('supertest');
const baseUrl = 'http://localhost:4567';

describe('API Tests', () => {
  it('should fetch test results', async () => {
    const res = await request(baseUrl).get('/api/results');
    res.should.have.status(200);
  });
});
