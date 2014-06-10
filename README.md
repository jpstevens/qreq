# qreq
[![Build Status](https://secure.travis-ci.org/jpstevens/qreq.png?branch=master)](https://travis-ci.org/jpstevens/qreq)

A q-style promise wrapper for HTTP requests

## Installation:

To install, go to your console/terminal and run:

```bash
npm install qreq
```

## Usage:

In your project, require the package:

```javascript
var qreq = require("qreq");
```

To make a get request:

```javascript
qreq
  .get("http://google.com")
  .then(function(res){
    console.log(res.body);
    //...
  })
  .fail(function(err){
    console.log(err);
    //...
  });
```