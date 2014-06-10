express = require "express"
bodyParser = require "body-parser"
server  = null
require "colors"

exports.start = (port) ->
  
  app    = express()
  router = express.Router()

  router
  .route '/test'
  .get (req, res, next) ->
    res.json { message: "GET complete." }
  .put (req, res, next) ->
    res.json { message: "PUT complete." }
  .post (req, res, next) ->
    res.json { message: "POST complete." }
  .delete (req, res, next) ->
    res.json { message: "DELETE complete." }
  
  app.use '/', router

  app.all '*', (req, res) -> res.json 404, { message: "Page not found" }

  server = app.listen port

exports.stop = -> server.close()