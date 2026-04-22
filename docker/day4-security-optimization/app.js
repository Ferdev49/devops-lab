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
        <title>Day 4 - Docker Security</title>
        <style>
            body { font-family: Arial; margin: 40px; background: #f0f0f0; }
            h1 { color: #333; }
            .status { padding: 20px; background: white; border-radius: 5px; }
            .success { color: green; font-weight: bold; }
        </style>
    </head>
    <body>
        <h1>🔒 Day 4: Docker Security & Optimization</h1>
        <div class="status">
            <p><strong>Container ID:</strong> ${os.hostname()}</p>
            <p><strong>Status:</strong> <span class="success"> ✅ RUNNING SECURELY</span></p>
            <p><strong>Port:</strong> 3000 (read-only container, non-root user)</p>
            <h2>Security Features Implemented</h2>
            <ul>
                <li>✅ Running as non-root user</li>
                <li>✅ Read-only filesystem</li>
                <li>✅ Minimal base image (alpine)</li>
                <li>✅ Multi-stage build</li>
                <li>✅ No unnecessary packages</li>
            </ul>
            <p><em>Day 4 of my DevOps journey - April 18, 2026</em></p>
        </div>
    </body>
    </html>
    `;

    res.end(html);
});

server.listen(port, hostname, () => {
    console.log(`[APP] Server running at http://${hostname}:${port}/`);
});