expect = require("chai").expect
qreq = require "../../src/qreq"
# test server config
port = 9090
host = "http://localhost:#{port}"
server = require "../fixtures/server"

describe "qreq", ->

  describe "post request", ->

    describe "without errors", ->

      validConfig = { url: "#{host}/json", json: { exampleParam: "exampleValue" } }
      expectedRes = { statusCode: 200, body: { message: "POST complete.", req: validConfig.json }}

      before -> server.start(port)
      after -> server.stop()

      describe "#post(url)", ->

        it "triggers .then(res) function", (done) ->

          qreq.post(validConfig.url).then (res) ->
            expect(res.statusCode).to.equal expectedRes.statusCode
            expect(res.body.message).to.equal expectedRes.body.message
            expect(res.body.req).to.deep.equal {}
            done()

      describe "#post(config)", ->

        it "triggers .then(res) function", (done) ->

          qreq.post(validConfig).then (res) ->
            expect(res.statusCode).to.equal expectedRes.statusCode
            expect(res.body).to.deep.equal expectedRes.body
            done()

      describe "#post(url, callback)", ->

        it "triggers callback function with signature (null, res)", (done) ->
          qreq.post validConfig.url, (err, res) ->
            expect(err).to.not.exist
            expect(res.statusCode).to.equal expectedRes.statusCode
            expect(res.body.message).to.equal expectedRes.body.message
            expect(res.body.req).to.deep.equal {}
            done()

      describe "#post(config, callback)", ->

        it "triggers callback function with signature (null, res)", (done) ->
          qreq.post validConfig, (err, res) ->        
            expect(err).to.not.exist
            expect(res.statusCode).to.deep.equal expectedRes.statusCode
            expect(res.body).to.deep.equal expectedRes.body
            done()

    describe "with errors", ->

      invalidConfig = { url: "" }

      describe "#post(url)", ->

        it "triggers .fail(err) function", (done) ->

          qreq.post(invalidConfig.url).fail (err) ->
            expect(err).to.exist
            done()

      describe "#post(config)", ->

        it "triggers .fail(res) function", (done) ->

          qreq.post(invalidConfig).fail (err) ->
            expect(err).to.exist
            done()

      describe "#post(url, callback)", ->

        it "triggers callback function with signature (err, null)", (done) ->
          qreq.post invalidConfig.url, (err, res) ->
            expect(err).to.exist
            expect(res).to.not.exist
            done()

      describe "#post(config, callback)", ->

        it "triggers callback function with signature (err, null)", (done) ->
          qreq.post invalidConfig, (err, res) ->        
            expect(err).to.exist
            expect(res).to.not.exist
            done()
