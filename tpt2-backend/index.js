const serverless = require("serverless-http");
const express = require("express");
const cors = require('cors');
const authentication = require('./endpoints/auth/authentication.js');

const app = express();

app.use(express.json());
app.use(cors());
app.use('/api', authentication);

// Error handler middleware
app.use((err, _req, res, _next) => {

  const statusCode = err.statusCode || 500;
  const responseBody = { error: { message: err.message || 'Internal Server Error', }, };
  res.status(statusCode).json(responseBody);
});
app.listen(3000, () => {
  console.log('Server started on port 3000');
})
module.exports.handler = serverless(app);
