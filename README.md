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

To make a GET request, using the promise syntax:

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

To make a GET request, using the callback syntax:

```javascript
qreq.get("http://google.com", function(err, res){
  if(err){
    console.log(err);
    //...
  } else {
    conslole.log(res.body);
    //...
  }
});
```

## Change log:

0.2.0 - Adds callback functionality