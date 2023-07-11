const express = require('express')
const app = express();
const bodyParser = require('body-parser');


app.use(bodyParser.json());

app.post('/function', (req, res) => {
  const sampleValue = req.body;
  console.log(sampleValue)
  res.json({ sampleValue })
})

app.listen(3000, () => {
  console.log("Currently listening to port 3000")
})