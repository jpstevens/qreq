request = require "request"
Q = require "q"

class RequestAdapter

  makeRequest: (config, callback) ->
    # init defer object
    deferred = Q.defer()
    # make request
    request config, (err, res) ->
      if err then deferred.reject(err)
      else deferred.resolve(res)
      callback err, res if callback
    # return promise
    deferred.promise

module.exports = new RequestAdapter()