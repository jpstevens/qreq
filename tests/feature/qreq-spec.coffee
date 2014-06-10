expect   = require("chai").expect
QRequest = require "../../src/qreq"
server   = require "../fixtures/server"
port = 9090
host = "http://localhost:#{port}"

describe "qRequest", ->

  beforeEach -> server.start(port)
  afterEach -> server.stop()

  describe "#get", ->

    it "should trigger #then(res) if the url is valid", (done) ->
      QRequest
      .get "#{host}/test", {}
      .then (res) ->
        console.log res.body
        expect(res.body).to.contain "GET complete"
        done()

    it "trigger #fail(err,res) if an error occured", (done) ->
      QRequest
      .get "#{host}/error", {}
      .fail (err, res) ->
        expect(err).to.not.equal null
        done()

  describe "#delete", ->

    it "should trigger #then(res) if the url is valid", (done) ->
      QRequest
      .delete "#{host}/test", {}
      .then (res) ->
        expect(res.body).to.contain "DELETE complete"
        done()

    it "trigger #fail(err,res) if an error occured", (done) ->
      QRequest
      .delete "#{host}/error", {}
      .fail (err, res) ->
        expect(err).to.not.equal null
        done()

  describe "#post", ->

    it "should trigger #then(res) if the url is valid", (done) ->
      QRequest
      .post "#{host}/test", {}
      .then (res) ->
        expect(res.body).to.contain "POST complete"
        done()

    it "trigger #fail(err,res) if an error occured", (done) ->
      QRequest
      .post "#{host}/error", {}
      .fail (err, res) ->
        expect(err).to.not.equal null
        done()

  describe "#put", ->

    it "should trigger #then(res) if the url is valid", (done) ->
      QRequest
      .put "#{host}/test", {}
      .then (res) ->
        expect(res.body).to.contain "PUT complete"
        done()

    it "trigger #fail(err,res) if an error occured", (done) ->
      QRequest
      .put "#{host}/error", {}
      .fail (err, res) ->
        expect(err).to.not.equal null
        done()