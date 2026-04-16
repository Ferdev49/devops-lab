const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;
const fs = require('fs');

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  fs.readFile('DOCKER.md', 'utf8', (err, data) => {
    if (err) {
      res.statusCode = 500;
      res.end('Error reading DOCKER.md\n');
    } else {
      res.end(data);
    }
  });
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});