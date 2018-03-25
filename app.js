const express = require('express')
const configRoute = require('./routes')
const bodyParser = require('body-parser')
const cors = require('cors')

const app = express()
app.use(bodyParser.json())
app.use(bodyParser.raw())
app.use(bodyParser.urlencoded({extended: true}));
app.use(cors())

configRoute(app)

app.listen(5000, () => {
  console.log("App is running on port 5000!")
})