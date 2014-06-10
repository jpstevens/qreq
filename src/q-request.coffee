HTTPStatus = require "http-status"
request = require "request"
Q = require "q"
require "colors"

class QRequest

  standardRequest = (config) ->
    # init defer object
    deferred = Q.defer()
    # make request
    request config, (err, res) ->
      if err
        deferred.reject err, res
      else if (res.statusCode < 200) or (res.statusCode >= 300)
        err = new Error "#{res.statusCode} #{HTTPStatus[res.statusCode]}"
        deferred.reject err, res
      else
        deferred.resolve res
    # return promise
    deferred.promise

  @get: (url) ->
    standardRequest
      method: "GET"
      url: url

  @post: (url, data) ->
    standardRequest
      method: "POST"
      url: url
      form: data

  @delete: (url) ->
    standardRequest
      method: "DELETE"
      url: url

  @put: (url, data) ->
    standardRequest
      method: "PUT"
      url: url
      form: data

module.exports = QRequest