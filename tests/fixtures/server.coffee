express = require "express"
bodyParser = require "body-parser"
server  = null

exports.start = (port) ->
  
  app    = express()
  router = express.Router()

  app.use bodyParser()

  # JSON
  router
  .route '/json'
  .get (req, res, next) ->
    res.json { message: "GET complete." }
  .put (req, res, next) ->
    res.json { message: "PUT complete.", req: req.body }
  .post (req, res, next) ->
    res.json { message: "POST complete.", req: req.body }
  .delete (req, res, next) ->
    res.json { message: "DELETE complete." }

  # STRING
  router
  .route '/string'
  .get (req, res, next) ->
    res.send "GET complete."
  .put (req, res, next) ->
    res.json "PUT complete."
  .post (req, res, next) ->
    res.json "POST complete."
  .delete (req, res, next) ->
    res.json "DELETE complete."
  
  app.use '/', router

  app.all '*', (req, res) -> res.json 404, { message: "Page not found" }

  server = app.listen port, ->
    console.log "> server started on port #{port}"

exports.stop = -> server.close()