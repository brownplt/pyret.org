pyret.org
================================================================================

The source for `pyret.org`, the site for Pyret.

Installation
--------------------------------------------------------------------------------

Basic pollen setup:

```
npm install
raco pkg install pollen
raco pollen publish . ../pyret.org.published
```


Old build:

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

For embeds, run:

```
cp -r node_modules/pyret-embed/dist site/
```
