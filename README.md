# Karmabot 

**This is an early idea. It doesn't work yet**

This is your personal Reddit robot. He's a cool dude. His big brother is 
[Hubot](http://hubot.github.com/), who is also cool.

**You'll probably never have to hack on this repo directly.**

Instead this repo provides a library that's distributed by `npm` that you
simply require in your project. Follow the instructions below and get your own
karmabot ready to deploy.

## Getting your own

Make sure you have [node.js][nodejs] and [npm][npmjs] (npm comes with node v0.6.5+) installed.

Download the [latest version of karmabot][karmabot-latest].

Then follow the instructions in the [README][readme] in the extracted `karmabot`
directory.

[nodejs]: http://nodejs.org
[npmjs]: http://npmjs.org
[karmabot-latest]: https://kyleconroy.com/kyleconroy/karmabot/downloads
[readme]: https://kyleconroy.com/kyleconroy/kyleconroy/blob/master/src/templates/README.md

## Writing Scripts

## HTTP Listener

karmabot has a HTTP listener which listens on the port specified by the `PORT`
environment variable.

You can specify routes to listen on in your scripts by using the `router`
property on `robot`.

```coffeescript
module.exports = (robot) ->
  robot.router.get "/karmabot/version", (req, res) ->
    res.end robot.version
```

There are functions for GET, POST, PUT and DELETE, which all take a route and
callback function that accepts a request and a response.

## Testing karmabot locally

Install all of the required dependencies by running `npm install`.

It's easy to test scripts locally with an interactive shell:

    % export PATH="node_modules/.bin:$PATH"
    % bin/karmabot

... and to run unit tests:

    % make test

