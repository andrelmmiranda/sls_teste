const serverless = require("serverless-http");
const express = require("express");
const app = express();

const { router } = require('./src/routes');
const { sectorRouter } = require('./src/routes/sector');

app.use(express.json());
app.use(router, sectorRouter);

app.use((req, res, next) => {
  return res.status(404).json({
    error: "Not Found",
  });
});

module.exports.handler = serverless(app);
