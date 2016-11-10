#lang scribble/manual

@(require "../../lib/bootscrbl.rkt")

@title{Your Information and @code{code.pyret.org}}

The online Pyret editor,
@link["https://code.pyret.org"]{@code{code.pyret.org}}, uses your Google
Account to store programs, and reports some information about your use of the
editor to help us debug issues.  This page summarizes how the editor
uses your account and data.

@section{What permissions does @code{code.pyret.org} ask for and why?}

@itemlist[

@item{@emph{Know who you are on Google} and @emph{View your email address}: The
site needs to know your Google identity in order to reliably give persistent
access to saving to Drive that doesn't expire or require popping up new
windows while you're editing.}

@item{@emph{Manage your photos and videos} and @emph{View the photos, videos, and
albums in your Google Drive}:  This is used to import images into programs
from your Drive (which can be useful for customizing games, for example).}

@item{@emph{View and manage your spreadsheets on Google Drive}: This enables
importing tables and working with data sources in your Drive.}

@item{@emph{Add itself to Google Drive}: This lets you right-click on Pyret
programs in Google Drive and "Open with Pyret."}

@item{@emph{View and manage Google Drive files and folders that you have opened
or created with this app}: This lets the editor see, save, publish, and re-open
programs you create.}

]

You can always go to
@link["https://security.google.com/settings/security/permissions?pli=1"]{your
Google account settings} and remove all access that code.pyret.org has to your
account.  Your programs and @code{code.pyret.org} folders will not be deleted
if you do so.  You can always manually delete these folders and their contents
yourself.

@section{Where are things stored in my Drive?}

The site initially makes a single folder in your Google Drive, called
@code{code.pyret.org}, and stores all of your programs there, with the names
you choose for them.  They are all created with you as the owner, and private
to your account.  As you run programs, there is also a directory called
@code{code.pyret.org.compiled} that is used for caching compiled copies of
programs.

If you @emph{publish} programs, the site creates another folder, called
@code{code.pyret.org.shared}, and makes @emph{publicly-readable copies} of
programs you publish in that directory.  If you delete files in this folder,
links for those programs you have shared with others will stop working, but any
copies others have made will be theirs to keep.  Each time you publish a
program, a new copy is created from its current contents.

@section{How can I remove the access code.pyret.org has to my data?}

You can always go to
@link["https://security.google.com/settings/security/permissions?pli=1"]{https://security.google.com/settings/security/permissions?pli=1}
and remove all access that code.pyret.org has to your account.  Your programs
and the created folders will not be deleted if you do so.  You can
always manually delete the folder and its contents yourself.

@section{How can I see old versions of my programs?}

Google Drive automatically stores old versions of your programs as they are
saved (as it does for all files).  You can follow the instructions at
@link["https://support.google.com/drive/answer/2409045?hl=en"]{Google's support
site} to manage old versions of files that you may have saved over or renamed.


@section[#:tag "logging"]{What information is stored on Pyret servers?}

@bold{Files and Programs}

When you publish programs with the "Publish" button, or open images from your
Drive via the "Open" menu in the editor, the @code{code.pyret.org} server keeps
track of that file so it can show it to other users who view your program.

@bold{Basic Activity}

We collect basic information about your use of @code{code.pyret.org} to help us
improve the language and editor, and enable some debugging.  We send back
information about errors and error messages, login status (to debug issues with
connecting to Google), whether features such as the type-checker are used, and
preferences (such as which mode you choose to display highlights with).

@bold{Detailed Activity}

If you opt to contribute detailed usage information under the "More" menu (off
by default), we will also receive information about the contents of your
programs and the edits you make.

