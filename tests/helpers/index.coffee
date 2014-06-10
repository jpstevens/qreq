path     = require "path"
fs       = require "fs"

exports.loadView = (view) -> 
  fs.readFileSync path.resolve(__dirname, "../fixtures/views/#{view}"), "utf8"