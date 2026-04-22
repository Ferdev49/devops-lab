const http = require('http');
const os = require('os');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html');
  
  const html = `
    <h1>Welcome to My Docker App</h1>
    <p>Container ID: ${os.hostname()}</p>
    <p>This is Day 2 of my Docker learning journey</p>
    <p>Today I'm learning docker-compose!</p>
  `;
  
  res.end(html);
});

server.listen(port, hostname, () => {
  console.log(`[APP] Server running at http://0.0.0.0:${port}/`);
});