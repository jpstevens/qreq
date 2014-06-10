express = require "express"
bodyParser = require "body-parser"
server  = null

exports.start = (port) ->
  
  app    = express()
  router = express.Router()

  app.use bodyParser()

  router
  .route '/test'
  .get (req, res, next) ->
    res.json { message: "GET complete." }
  .put (req, res, next) ->
    res.json { message: "PUT complete.", req: req.body }
  .post (req, res, next) ->
    res.json { message: "POST complete.", req: req.body }
  .delete (req, res, next) ->
    res.json { message: "DELETE complete." }
  
  app.use '/', router

  app.all '*', (req, res) -> res.json 404, { message: "Page not found" }

  server = app.listen port

exports.stop = -> server.close()