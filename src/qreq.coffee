request = require "request"
Q = require "q"

RequestAdapter = require "./request-adapter"
ArgParser = require "./arg-parser"

class Qreq

  request = (method, args) ->
    opts = ArgParser.parse(method, args)
    RequestAdapter.makeRequest opts.config, opts.callback

  @get: (args...) -> request "get", args

  @post: (args...) -> request "post", args

  @delete: (args...) -> request "delete", args

  @put: (args...) -> request "put", args

module.exports = Qreq