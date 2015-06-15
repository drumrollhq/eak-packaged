var app = require('app'),
    BrowserWindow = require('browser-window'),
    path = require('path'),
    http = require('http'),
    connect = require('connect'),
    serveStatic = require('serve-static');

var mainWindow;

var server = connect();
server.use(serveStatic(path.join(__dirname, 'app')));
http.createServer(server).listen(5275, '127.0.0.1');

app.on('windows-all-closed', function() {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('ready', function() {
  mainWindow = new BrowserWindow({
    'width': 1024,
    'height': 768,
    'node-integration': false,
    'fullscreen': true
  });
  mainWindow.loadUrl('http://localhost:5275/en/play/');

  mainWindow.on('closed', function() {
    mainWindow = null;
  });
});
