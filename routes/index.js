const images = require('./images')
const blockchain = require('./blockchain')

const routes = app => {
  app.use('/images', images)
  app.use('/contract', blockchain)
  app.use("*", (req, res) => {
    res.status(404).json({ error: "Not found" });
  });
};

module.exports = routes;
