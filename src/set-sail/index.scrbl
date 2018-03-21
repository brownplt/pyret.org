#lang scribble/manual

@(require "../../lib/bootscrbl.rkt")

@title{Running Pyret}

You can run Pyret right in your browser by visiting
@link["https://code.pyret.org"]{code.pyret.org}. This is the easiest way to get
started. You can check out the
@link["https://www.pyret.org/docs/latest/A_Tour_of_Pyret.html"]{tour}
to see a small sample of programs and syntax.

If the command-line is your thing, you can check out the
@link["https://www.npmjs.com/package/pyret-experimental-cli"]{@code{npm}
package}, which lets you install a @code{pyret} command that you can use to
compile and run programs.

If you like to use your own editor offline, there are a few options for syntax
highlighting:

@itemlist[
@item{For Visual Studio Code or Atom, just search “Pyret” in the extensions
explorer (for Visual Studio Code) or the package installer (for Atom).

@image[#:scale 0.4 "site/img/atom.png"] @image[#:scale 0.4 "site/img/vscode.png"]}
@item{For Emacs, Sublime, and Vim, check out the
@link["https://github.com/brownplt/pyret-lang/tree/master/tools"]{@code{tools/}
directory in the pyret-lang repository}.}
]

To dig into all the details or contribute, can check out the repository on Github:

@link["https://github.com/brownplt/pyret-lang"]{https://github.com/brownplt/pyret-lang}

