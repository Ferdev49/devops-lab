const http = require('http');
const os = require('os');
const fs = require('fs');
const path = require('path');

const hostname = '0.0.0.0';
const port = 3000;

let requestCount = 0;

// Read secrets/configs (if they exist)
let apiKey = 'NOT_CONFIGURED';
let databaseUrl = 'NOT_CONFIGURED';
let appEnv = process.env.NODE_ENV || 'development';

// Try to read from Docker secrets (Swarm mode)
const secretsPath = '/run/secrets';
if (fs.existsSync(secretsPath)) {
  try {
    if (fs.existsSync(path.join(secretsPath, 'api_key'))) {
      apiKey = fs.readFileSync(path.join(secretsPath, 'api_key'), 'utf8').trim();
    }
    if (fs.existsSync(path.join(secretsPath, 'db_url'))) {
      databaseUrl = fs.readFileSync(path.join(secretsPath, 'db_url'), 'utf8').trim();
    }
  } catch (err) {
    console.log('[WARN] Could not read secrets:', err.message);
  }
}

const server = http.createServer((req, res) => {
  requestCount++;
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  let html = '<!DOCTYPE html><html><head><title>Day 6 - Docker Secrets</title>';
  html += '<style>';
  html += 'body { font-family: Arial; margin: 40px; background: #f0f0f0; }';
  html += 'h1 { color: #333; }';
  html += '.status { padding: 20px; background: white; border-radius: 5px; }';
  html += '.success { color: green; font-weight: bold; }';
  html += '.warning { color: orange; font-weight: bold; }';
  html += '.info { background: #e3f2fd; padding: 10px; margin: 10px 0; border-left: 4px solid #2196F3; }';
  html += '</style></head><body>';
  html += '<h1>🔐 Day 6: Docker Secrets & Configuration Management</h1>';
  html += '<div class="status">';
  html += '<p><strong>Container ID:</strong> ' + os.hostname() + '</p>';
  html += '<p><strong>Environment:</strong> ' + appEnv + '</p>';
  html += '<p><strong>Total Requests:</strong> ' + requestCount + '</p>';
  
  html += '<div class="info"><h3>Configuration Status</h3><ul>';
  html += '<li><strong>API Key:</strong> ' + (apiKey === 'NOT_CONFIGURED' ? '<span class="warning">⚠️ NOT CONFIGURED</span>' : '<span class="success">✅ LOADED FROM SECRETS</span>') + '</li>';
  html += '<li><strong>Database URL:</strong> ' + (databaseUrl === 'NOT_CONFIGURED' ? '<span class="warning">⚠️ NOT CONFIGURED</span>' : '<span class="success">✅ LOADED FROM SECRETS</span>') + '</li>';
  html += '</ul></div>';

  html += '<div class="info"><h3>Secrets vs Environment Variables</h3><ul>';
  html += '<li><strong>Secrets:</strong> Stored securely, not in image, only available to service</li>';
  html += '<li><strong>Configs:</strong> Non-sensitive configuration data</li>';
  html += '<li><strong>Environment Variables:</strong> Visible in docker inspect (NOT for secrets!)</li>';
  html += '</ul></div>';

  html += '<div class="info"><h3>What I\'m Learning</h3><ul>';
  html += '<li>How to manage sensitive data securely</li>';
  html += '<li>Docker secrets in Swarm mode</li>';
  html += '<li>Best practices for configuration</li>';
  html += '<li>Never hardcode passwords or API keys</li>';
  html += '</ul></div>';

  html += '<p><em>Day 6 of my DevOps journey - April 20, 2026</em></p>';
  html += '</div></body></html>';

  res.end(html);
});

server.listen(port, hostname, () => {
  console.log('[APP] Secure app running at http://' + hostname + ':' + port + '/');
  console.log('[CONFIG] Environment: ' + appEnv);
  console.log('[SECRETS] API Key loaded: ' + (apiKey !== 'NOT_CONFIGURED'));
  console.log('[SECRETS] DB URL loaded: ' + (databaseUrl !== 'NOT_CONFIGURED'));
});