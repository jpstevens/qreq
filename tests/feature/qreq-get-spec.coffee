expect   = require("chai").expect
qreq = require "../../src/qreq"
server   = require "../fixtures/server"
port = 9090
host = "http://localhost:#{port}"

describe "qreq", ->

  describe "get", ->

    success = { url: "#{host}/test" }
    expectedResponse = JSON.stringify { message: "GET complete." }

    beforeEach -> server.start(port)
    afterEach -> server.stop()

    describe "(url)", ->

      describe "success", ->

        it "triggers #then(res)", (done) ->
          qreq
          .get success.url
          .then (res) ->
            expect(res.body).to.not.equal null
            expect(res.body).to.equal expectedResponse
            done()

      describe "error", ->

        it "triggers #fail(err)", (done) ->
          qreq
          .get ""
          .fail (err) ->
            expect(err).to.not.equal null
            done()

    describe "(config)", ->

      describe "success", ->

        it "triggers #then(res)", (done) ->
          qreq
          .get success
          .then (res) ->
            expect(res.body).to.equal expectedResponse
            expect(res.body).to.not.equal null
            done()

      describe "error", ->

        it "triggers #fail(err)", (done) ->
          qreq
          .get {}
          .fail (err) ->
            expect(err).to.not.equal null
            done()


    describe "without any arguments", ->

      it "throws an error", ->
        expect(-> qreq.get()).to.throw Error