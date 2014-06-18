class SignatureChecker

  matches: (args, signature...) ->
    return false if args.length != signature.length
    ( return false if typeof args[i] isnt sig ) for sig, i in signature
    true

module.exports = new SignatureChecker()