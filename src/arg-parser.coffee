signature = require "./signature-checker"

class ArgParser

  parse: (method, args) ->
    opts = {}
    method = method.toUpperCase()
    switch method
      when "GET", "DELETE" then opts = @getOpts(args, false)
      when "POST",  "PUT" then opts = @getOpts(args, true)
      else throw new Error "Method must be GET, DELETE, POST or PUT"
    opts.config.method = method
    opts

  getOpts: (args, hasData = false) ->
    opts = {}
    # post(config, callback) or put(config, callback) or get(config, callback) or delete(config, callback)
    if signature.matches(args, "object", "function")
      opts.config = args[0]
      opts.callback = args[1]
      if opts.config.json is undefined then opts.config.json = true
    # get(url, callback) or delete(url, callback) or post(url, callback) or put(url, callback)
    else if signature.matches(args, "string", "function")
      opts.config = { url: args[0] }
      opts.callback = args[1]
      if hasData then opts.config.json = {} else opts.config.json = true
    # post(url, json, callback) or put(url, json, callback)
    else if signature.matches(args, "string", "object", "function") and hasData
      opts.config = { url: args[0], json: args[1] }
      opts.callback = args[2]
    # get(url) or delete(url) or post(url) or put(url)
    else if signature.matches(args, "string")
      opts.config = { url: args[0] }
      if hasData then opts.config.json = {} else opts.config.json = true
    # post(config) or put(config) or get(config) or delete(config)
    else if signature.matches(args, "object")
      opts.config = args[0]
      if opts.config.json is undefined then opts.config.json = true
    # post(url, json) or put(url, json)
    else if signature.matches(args, "string", "object") and hasData
      opts.config = { url: args[0], json: args[1] }
    else
      throw new Error "Invalid params: #{args.join(', ')}"
    # return parsed options
    opts

module.exports = new ArgParser()
  