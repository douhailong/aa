const { createServer } = require('node:http');
const server = createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ aaa: 1111, bbb: 2222, ccc: [{ e: 2, u: 9 }] }));
});
// starts a simple http server locally on port 3000
server.listen(3000, () => {
  console.log('Listening on 192.168.2.53:3000');
});
