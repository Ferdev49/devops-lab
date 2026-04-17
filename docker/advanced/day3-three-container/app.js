const http = require('http');
const os = require('os');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  const html = `
    <!DOCTYPE html>
    <html>
    <head>
      <title>Day 3 Docker App</title>
      <style>
        body { font-family: Arial; margin: 40px; background: #f0f0f0; }
        h1 { color: #333; }
        .status { padding: 20px; background: white; border-radius: 5px; }
        .success { color: green; font-weight: bold; }
      </style>
    </head>
    <body>
      <h1>🐳 Day 3: Docker Multi-Container App</h1>
      <div class="status">
        <p><strong>Container ID:</strong> ${os.hostname()}</p>
        <p><strong>Node.js App Status:</strong> <span class="success">✅ RUNNING</span></p>
        <p><strong>Port:</strong> 3000</p>
        <h2>What I'm Learning Today</h2>
        <ul>
          <li>Docker networking with custom bridge networks</li>
          <li>Service-to-service communication</li>
          <li>Data persistence with volumes</li>
          <li>Docker compose orchestration</li>
        </ul>
        <p><em>Day 3 of my DevOps journey - April 17, 2026</em></p>
      </div>
    </body>
    </html>
  `;

  res.end(html);
});

server.listen(port, hostname, () => {
  console.log(`[APP] Server running at http://${hostname}:${port}/`);
});