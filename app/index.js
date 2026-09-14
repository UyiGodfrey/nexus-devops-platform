const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.json({
    message: 'Nexus DevOps Platform API is running',
    environment: process.env.NODE_ENV || 'development'
  });
});

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    service: 'nexus-api'
  });
});

app.get('/api/info', (req, res) => {
  res.json({
    project: 'Nexus DevOps Platform',
    version: '1.0.0',
    purpose: 'SIWES DevOps automation project'
  });
});

if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Nexus API running on port ${PORT}`);
  });
}

module.exports = app;
