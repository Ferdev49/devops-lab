const http = require('http');
const os = require('os');

const hostname = '0.0.0.0';
const port = 3000;

let requestCount = 0;

const server = http.createServer((req, res) => {
  requestCount++;
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  const html = \
    <!DOCTYPE html>
    <html>
    <head>
      <title>Day 5 - Docker Swarm</title>
      <style>
        body { font-family: Arial; margin: 40px; background: #f0f0f0; }
        h1 { color: #333; }
        .status { padding: 20px; background: white; border-radius: 5px; }
        .success { color: green; font-weight: bold; }
        .info { background: #e3f2fd; padding: 10px; margin: 10px 0; }
      </style>
    </head>
    <body>
      <h1>🐋 Day 5: Docker Swarm Introduction</h1>
      <div class="status">
        <p><strong>Container ID:</strong> \</p>
        <p><strong>Hostname:</strong> \</p>
        <p><strong>Status:</strong> <span class="success">✅ RUNNING IN SWARM MODE</span></p>
        <p><strong>Total Requests Served:</strong> \</p>
        
        <div class="info">
          <h3>What is Docker Swarm?</h3>
          <ul>
            <li>Native Docker orchestration tool</li>
            <li>Manages multiple containers across multiple nodes</li>
            <li>Built-in load balancing</li>
            <li>Service discovery</li>
            <li>Rolling updates</li>
            <li>Simpler than Kubernetes (but less powerful)</li>
          </ul>
        </div>

        <div class="info">
          <h3>Swarm Concepts</h3>
          <ul>
            <li><strong>Manager Node:</strong> Manages the cluster</li>
            <li><strong>Worker Node:</strong> Runs containers</li>
            <li><strong>Service:</strong> Container definition with replicas</li>
            <li><strong>Task:</strong> Individual container instance</li>
            <li><strong>Overlay Network:</strong> Multi-host networking</li>
          </ul>
        </div>

        <p><em>Day 5 of my DevOps journey - April 20, 2026</em></p>
      </div>
    </body>
    </html>
  \;

  res.end(html);
});

server.listen(port, hostname, () => {
  console.log(\[APP] Swarm Service running at http://\:\/\);
});
