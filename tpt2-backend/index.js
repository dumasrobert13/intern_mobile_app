const serverless = require("serverless-http");
const express = require("express");
const app = express();
const cors = require('cors');
const router = require('./endpoints/auth/userAuth.js');

app.use(bodyParser.json());
app.use(cors());
app.use(router);

app.get("/", (req, res, next) => {
  return res.status(200).json({
    message: "Hello from root!",
  });
});

app.get("/path", (req, res, next) => {
  return res.status(200).json({
    message: "Hello from path!",
  });
});

app.use((req, res, next) => {
  return res.status(404).json({
    error: "Not Found",
  });
});

// Error handler middleware
app.use((err, req, res, next) => {

  const statusCode = err.statusCode || 500;
  const responseBody = { error: { message: err.message || 'Internal Server Error', }, };
  res.status(statusCode).json(responseBody);
});

app.listen(3000, () => {
  console.log("Currently listening to port 3000");
})

module.exports.handler = serverless(app);
