const express = require('express');
const os = require('os');
const app = express();
const port = 3000;
const host = '0.0.0.0'; 

app.get('/info', (req, res) => {
  const hostname = os.hostname();
  const networkInterfaces = os.networkInterfaces();
  let ip = 'Not found';

  // Buscar la primera IP no interna (IPv4)
  for (const iface of Object.values(networkInterfaces)) {
    for (const config of iface) {
      if (!config.internal && config.family === 'IPv4') {
        ip = config.address;
        break;
      }
    }
  }

  res.json({ hostname, ip });
});

app.listen(port, host,() => {
  console.log('Server running at http://${host}:${port}');
});
