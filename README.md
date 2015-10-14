# urlshort
A url shortener written in Lua in your nginx config

It will archive a page at web.archive.org each time somebody shortens a link

## Install
This is set up to run on freebsd.  It should work on other unixes with few 
changes.

You will need nginx installed with the 3rd party postgres and lua modules 
compiled in.

You will need lua json `/usr/local/share/lua/5.1/json/`.

This requires a nginx.conf file that includes urlshort the `http` section.

Please change the db and db user as needed.

Be sure to change the `server_name` and the redirect location in the first 
location block.

Put i.html and index.html in `/var/www/urls/`.

## Features
- Doesn’t duplicate links
- Saves pages to archive.org
- Info page at `/i/<id>`
- Json info at `/a/<id>` and `/s/<id>`

# Example
See an example of this in production at [mtb.wtf](http://mtb.wtf/)

# Notes
If you are making edits, make sure to use `postgres_escape` on any variables 
used in a query.
