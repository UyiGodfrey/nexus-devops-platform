const test = require('node:test');
const assert = require('node:assert');
const app = require('../index');

test('GET /health returns healthy Nexus API', async () => {
  const server = app.listen(0);

  try {
    const address = server.address();
    const response = await fetch(`http://localhost:${address.port}/health`);
    const body = await response.json();

    assert.strictEqual(response.status, 200);
    assert.strictEqual(body.status, 'healthy');
    assert.strictEqual(body.service, 'nexus-api');
  } finally {
    server.close();
  }
});
