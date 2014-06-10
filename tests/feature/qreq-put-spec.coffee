expect   = require("chai").expect
qreq = require "../../src/qreq"
server   = require "../fixtures/server"
port = 9090
host = "http://localhost:#{port}"

describe "qreq", ->

  describe "put", ->

    success = { method: "PUT", url: "#{host}/test", json: { message: "Sending PUT..." }}
    expectedResponse = { message: "PUT complete.", req: success.json }

    beforeEach -> server.start(port)
    afterEach -> server.stop()

    describe "\b(url, data)", ->

      describe "success", ->

        it "triggers #then(res)", (done) ->
          qreq
          .put success.url, success.json
          .then (res) ->
            expect(res.body).to.not.equal null
            console.log res.body
            console.log expectedResponse
            expect(JSON.stringify(expectedResponse)).to.equal JSON.stringify(res.body)
            done()

      describe "error", ->

        it "triggers #fail(err)", (done) ->
          qreq
          .put ""
          .fail (err) ->
            expect(err).to.not.equal null
            done()

    describe "\b(config)", ->

      describe "success", ->

        it "triggers #then(res)", (done) ->
          qreq
          .put success
          .then (res) ->
            expect(res.body).to.not.equal null
            expect(JSON.stringify(expectedResponse)).to.equal JSON.stringify(res.body)
            done()

      describe "error", ->

        it "triggers #fail(err)", (done) ->
          qreq
          .put {}
          .fail (err) ->
            expect(err).to.not.equal null
            done()


    describe "without any arguments", ->

      it "throws an error", ->
        expect(-> qreq.put()).to.throw Error