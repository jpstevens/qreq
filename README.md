# q-request
[![Build Status](https://secure.travis-ci.org/jpstevens/cmd-exec.png?branch=master)](https://travis-ci.org/jpstevens/cmd-exec)

A q-style promise wrapper for HTTP requests

## Installation:

To install, go to your console/terminal and run:

```bash
npm install q-request
```

## Usage:

In your project, require the package:

```javascript
var qreq = require("q-request");
```

To make a get request:

```javascript
qreq
  .get("http://google.com")
  .then(function(res, body){
    console.log(body);
    #...
  })
  .fail(function(err, res, body){
    console.log(err);
    #...
  });
```