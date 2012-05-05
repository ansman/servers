Servers
=======

Why
---
Often when you write a server application things do not go as expected.
I've found that it's a big help to have a stupid echo server which just prints
the request. It doesn't need to respond with anything specific, just output headers
and the request.

In this repository you'll find a simple echo server implemented in common languages.

How
---
Some servers are implemented using a web server (node.js for example) while some use
a simple server socket (ruby for example).

Some output just the `HTTP/1.0 200 OK` while some add some headers, it depends on the
language/framework.

The goal is to have no dependencies beside the bare minimum and that all servers can be started using `./server.<ext> [port=8080] [host=127.0.0.1]` with the host and port being optional.
Of course this isn't possible in all languages (compiled languages).

Contributing
------------
Add your favorite language and make a pull request!

License
-------
This is project is licensed under the [MIT License](http://en.wikipedia.org/wiki/MIT_License).
