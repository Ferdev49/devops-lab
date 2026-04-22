const http = require('http');
const os = require('os');
const fs = require('fs');
const path = require('path');

const hostname = '0.0.0.0';
const port = 3000;

let requestCount = 0;
const startTime = new Date();

// Read secrets if available
let secretsLoaded = false;
const secretsPath = '/run/secrets';
if (fs.existsSync(secretsPath)) {
  try {
    fs.readdirSync(secretsPath);
    secretsLoaded = true;
  } catch (err) {
    console.log('[WARN] Secrets path not accessible');
  }
}

const server = http.createServer((req, res) => {
  requestCount++;
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  const uptime = Math.floor((new Date() - startTime) / 1000);
  const hours = Math.floor(uptime / 3600);
  const minutes = Math.floor((uptime % 3600) / 60);
  const seconds = uptime % 60;

  let html = '<!DOCTYPE html><html><head><title>Day 7 - Docker Final Project</title>';
  html += '<style>';
  html += 'body { font-family: Arial; margin: 40px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #333; }';
  html += 'h1 { color: white; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); }';
  html += '.container { max-width: 900px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 10px 30px rgba(0,0,0,0.3); }';
  html += '.section { margin: 20px 0; padding: 15px; background: #f5f5f5; border-left: 4px solid #667eea; }';
  html += '.success { color: green; font-weight: bold; }';
  html += '.metric { display: inline-block; margin-right: 30px; padding: 10px; background: #e3f2fd; border-radius: 5px; }';
  html += 'ul { line-height: 1.8; }';
  html += '.stats { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin: 20px 0; }';
  html += '.stat-box { background: #e8f5e9; padding: 15px; border-radius: 5px; text-align: center; }';
  html += '.stat-box h3 { margin: 0; color: #2e7d32; }';
  html += '.stat-box p { margin: 5px 0 0 0; font-size: 24px; color: #1b5e20; }';
  html += '</style></head><body>';
  
  html += '<div class="container">';
  html += '<h1>🐳 Docker Journey Complete - Day 7 Final Project</h1>';
  
  html += '<div class="section">';
  html += '<h2>Container Information</h2>';
  html += '<p><strong>Container ID:</strong> ' + os.hostname() + '</p>';
  html += '<p><strong>Node.js Version:</strong> ' + process.version + '</p>';
  html += '<p><strong>Environment:</strong> ' + (process.env.NODE_ENV || 'production') + '</p>';
  html += '</div>';
  
  html += '<div class="stats">';
  html += '<div class="stat-box"><h3>Requests Served</h3><p>' + requestCount + '</p></div>';
  html += '<div class="stat-box"><h3>Container Uptime</h3><p>' + hours + 'h ' + minutes + 'm ' + seconds + 's</p></div>';
  html += '</div>';
  
  html += '<div class="section">';
  html += '<h2>✅ What I Learned (Days 1-7)</h2>';
  html += '<ul>';
  html += '<li><strong>Day 1:</strong> Docker basics - Dockerfile, images, containers</li>';
  html += '<li><strong>Day 2:</strong> docker-compose - Multi-container with Node + Redis</li>';
  html += '<li><strong>Day 3:</strong> Networking - Custom bridge networks, service discovery</li>';
  html += '<li><strong>Day 4:</strong> Security & Optimization - Non-root user, multi-stage builds</li>';
  html += '<li><strong>Day 5:</strong> Orchestration - Docker Swarm concepts and clustering</li>';
  html += '<li><strong>Day 6:</strong> Secrets Management - Secure data handling patterns</li>';
  html += '<li><strong>Day 7:</strong> Advanced Patterns - Production-ready applications</li>';
  html += '</ul>';
  html += '</div>';
  
  html += '<div class="section">';
  html += '<h2>🎯 Key Technologies</h2>';
  html += '<ul>';
  html += '<li>Docker & docker-compose</li>';
  html += '<li>Node.js + npm</li>';
  html += '<li>Alpine Linux (minimal base images)</li>';
  html += '<li>Docker networking (bridge, overlay)</li>';
  html += '<li>Volumes (named volumes, data persistence)</li>';
  html += '<li>Health checks</li>';
  html += '<li>Security best practices (non-root, capabilities)</li>';
  html += '<li>Secrets & configuration management</li>';
  html += '</ul>';
  html += '</div>';
  
  html += '<div class="section">';
  html += '<h2>📚 Resources Created</h2>';
  html += '<ul>';
  html += '<li>6 Docker applications</li>';
  html += '<li>20+ documentation files</li>';
  html += '<li>15+ commits to GitHub</li>';
  html += '<li>Complete docker/advanced folder with all projects</li>';
  html += '</ul>';
  html += '</div>';
  
  html += '<div class="section">';
  html += '<h2>🚀 Next Steps</h2>';
  html += '<ul>';
  html += '<li>Week 2: Terraform (Infrastructure as Code)</li>';
  html += '<li>Week 3+: Kubernetes (Production orchestration)</li>';
  html += '<li>Week 5-6: Full portfolio projects</li>';
  html += '<li>Week 7-8: Job search & interviews</li>';
  html += '</ul>';
  html += '</div>';
  
  html += '<div class="section" style="background: #fff3e0; border-left-color: #f57c00;">';
  html += '<h2>💡 Most Important Learnings</h2>';
  html += '<ul>';
  html += '<li>Docker makes applications portable and reproducible</li>';
  html += '<li>docker-compose simplifies multi-container management</li>';
  html += '<li>Security must be built in from the start (non-root, read-only)</li>';
  html += '<li>Optimization matters (image size, layer caching)</li>';
  html += '<li>Never hardcode secrets - use proper management</li>';
  html += '<li>Networking enables service communication</li>';
  html += '<li>Orchestration is essential for production</li>';
  html += '</ul>';
  html += '</div>';
  
  html += '<p style="text-align: center; margin-top: 30px; color: #666;"><em>Day 7 of my DevOps journey - April 21, 2026</em></p>';
  html += '</div></body></html>';

  res.end(html);
});

server.listen(port, hostname, () => {
  console.log('[APP] Docker Final Project running at http://' + hostname + ':' + port + '/');
  console.log('[INFO] Container started successfully');
  console.log('[INFO] Secrets available: ' + secretsLoaded);
  console.log('[SUCCESS] All Docker learning complete!');
});
