for example
===========

Simple utility for fixing all the headers on raw.github.com hosted files.  So when you see "example.html" 
in a repo and don't feel like downloading the entire repository to see if the javascript looks cool, this 
would work.  It's a sinatra server, that proxies all it's urls to raw.github.com.

    http://localhost:4567/trevorgrayson/trevorgrayson.com/master/index.html
    
    becomes...
    https://raw.github.com/trevorgrayson/trevorgrayson.com/master/index.html
