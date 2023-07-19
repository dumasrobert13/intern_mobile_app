const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const router = require('./endpoints/auth/userAuth.js');

const app = express();

app.use(bodyParser.json());
app.use(cors());
app.use(router);

// Error handler middleware
app.use((err, req, res, next) => {

  const statusCode = err.statusCode || 500;
  const responseBody = { error: { message: err.message || 'Internal Server Error', }, };
  res.status(statusCode).json(responseBody);
});

app.listen(3000, () => {
  console.log("Currently listening to port 3000");
})