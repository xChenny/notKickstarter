const express = require('express')
const configRoute = require('./routes')
const bodyParser = require('body-parser')

const app = express()
app.use(bodyParser.json())
app.use(bodyParser.raw())
app.use(bodyParser.urlencoded({extended: false}));

configRoutes(app)

app.listen(5000, () => {
  console.log("App is running on port 5000!")
})