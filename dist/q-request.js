(function() {
  var HTTPStatus, Q, QRequest, request;

  HTTPStatus = require("http-status");

  request = require("request");

  Q = require("q");

  QRequest = (function() {
    var standardRequest;

    function QRequest() {}

    standardRequest = function(config) {
      var deferred;
      config.timeout = 30000;
      deferred = Q.defer();
      request(config, function(err, res, body) {
        if (err) {
          return deferred.reject({
            body: null,
            error: new Error(err)
          });
        } else if (res.statusCode !== 200) {
          return deferred.reject({
            body: JSON.parse(body),
            error: new Error("" + res.statusCode + " " + HTTPStatus[res.statusCode])
          });
        } else {
          return deferred.resolve({
            body: JSON.parse(body),
            error: null
          });
        }
      });
      return deferred.promise;
    };

    QRequest.get = function(url) {
      return standardRequest({
        method: "GET",
        url: url
      });
    };

    QRequest.post = function(url, data) {
      return standardRequest({
        method: "POST",
        url: url,
        form: data
      });
    };

    QRequest["delete"] = function(url) {
      return standardRequest({
        method: "DELETE",
        url: url
      });
    };

    QRequest.put = function(url, data) {
      return standardRequest({
        method: "PUT",
        url: url,
        form: data
      });
    };

    return QRequest;

  })();

  module.exports = QRequest;

}).call(this);
