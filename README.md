pyret.org
================================================================================

The source for `pyret.org`, the site for Pyret.

Installation
--------------------------------------------------------------------------------

Run `npm install` first.

You need Pygments and frog:

````sh
$ easy_install Pygments
$ raco pkg install frog
````

To build and preview, run:

````sh
$ make pages
$ make serve
````

To push to the `___staging` subdir, run:

````sh
$ make stage
````

Instructions on how to edit coming soon.
