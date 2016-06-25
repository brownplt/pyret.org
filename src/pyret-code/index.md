# The Pyret Code; or A Case for the Pyret Programming Language

We need better languages for introductory computing. A good
introductory language makes good compromises between expressiveness
and performance, and between simplicity and feature-richness. Pyret is
our evolving experiment in this space.

### Why not just use Java, Python, Racket, OCaml, or Haskell?

One of the enduring lessons from the Racket project is that _no
full-blown, general-purpose programming language_ is particularly
appropriate for introductory education. By the time a language grows
to be useful for building large-scale systems, it tends to have
accumulated too many warts, odd corners, and complex features, all of
which trip up students.
The [journal paper for DrScheme](http://cs.brown.edu/~sk/Publications/Papers/Published/fffkf-drscheme-journal/) 
(the old name for DrRacket) explains this in some detail.

In that respect, the closest fellow travelers of us Pyreteers are the
Racketeers (see how that works?). In fact, the first version of Pyret
was merely a `#lang` in Racket. Nevertheless, Pyret represents a
departure from Racket (for now and for the near future, at least) for
several reasons:

* We wanted to experiment with syntax. Much as many of us love
  parentheses, we fear that Racket will always bump into an acceptance
  threshold due to its syntax. We're delighted to see the growing
  adoption in industry of languages like Racket and Clojure, and maybe
  the days of paren-phobia are over. But academics are far more
  hidebound than industrial programmers!

* We wanted to build a really great run-time system for the Web
browser. Going through Racket and
  [Whalesong](http://cs.brown.edu/~sk/Publications/Papers/Published/yk-whalesong-racket-browser/)
  proved to be a non-starter in terms of performance, and Racket has
  too many features that make an efficient implementation on today's
  JavaScript very hard. Building a native JavaScript implementation
  was the only option we could see. Over time, as technology changes,
  this could prove to be wrong.

* Though our pedagogy draws from and is very similar to that of the
  Racketeers, it also diverges in some ways, reflecting the somewhat
  different backgrounds and preferences of team. Pyret embodies _our_
  educational philosophy. We felt we could more easily experiment if
  we had a clean-slate design than if we had to keep fitting our work
  into the constraints of Racket.

* Ultimately, Racket's `#lang` facilities, though designed to create
  new languages—and a great prototyping ground for Pyret—proved to not
  be quite enough to support a language creation process of the scale
  of Pyret; and the need for a strong Web run-time system also meant
  that we did not get enough out of the Racket ecosystem.
  Nevertheless, that only represents the state of systems today; if
  someday the two grew closer together, many or all of us would
  rejoice.

### Will Pyret ever be a full-fledged programming language?

Yes.

First of all, Pyret is much more powerful than you might realize.
Pyret is already fully-fledged enough to self-host its compiler, which
is a non-trivial and realistic challenge. What that means is, when you
run Pyret in your browser, it loads JavaScript code that implements a
Pyret-to-JavaScript compiler (i.e., it compiles the Pyret you type
into JavaScript and runs it in the browser). This compiler was
produced by the Pyret-to-JavaScript compiler by compiling the
Pyret-to-JavaScript compiler. Take a look at the compiler's
[bootstrapping phases](https://github.com/brownplt/pyret-lang/) to get
a sense of its sophistication.

Second, underneath Pyret is a very powerful run-time system based on
over a decade of research. You don't see it as a user of the language,
and that's the point. Many other languages expose the crippling
limitations of JavaScript's run-time to users (e.g., can't halt a
long-running computation, can't yield control to the event loop,
etc.). These languages effectively let _the medium become part of the
message_, whereas we believe programmers — especially early-stage
student programmers — should not have to confront these complexities,
which are irrelevant to (and often significantly interfere with) the
material they are trying to learn. Imagine if other languages said,
“We'd love to give you function calls, but the x86 instruction set
doesn't contain them, so we can't — sorry!” Yet they do the equivalent
when it comes to giving you control over your computation on top of
JavaScript. In contrast, Pyret is uncompromising.

Third, we view _building an awesome teaching language_ as as a useful
design discipline that necessarily entails all the features typically
expected of a mature language.  When building a language, you're
constantly confronted with questions: what to do next, how to do it,
and whether to do it at all. Language designers therefore need a
mental framework that guides their choices. For some, it might be
“Build an awesome language for shared-memory concurrency!” For others
it might be “Build an awesome language for writing scientific
computations very, very concisely!”  For us, it's “Build an awesome
teaching language!” So whenever we're confronted with a design (or
implementation) choice, we first ask how it would play out _in this
specific context_. Then we ask how it would impact our long-term
goal. We have yet to find actual contradictions between the two, but
it's certainly re-ordered priorities.

### There are lots of kinds of “education”.

That's right. We are focused on introductory programming education at
a high-school and collegiate level — what is often called “CS 1” and
“CS 2” (roughly, the first year of college). Pyret is also being
actively _used_ in exactly that setting, giving us a tight feedback
loop.

Of course, even in that setting there are differences of opinion about
what needs to be taught. Some believe inheritance is so important it
should be taught early in the first semester. We utterly reject this
belief (as someone once wisely said, “object-oriented programming does
not scale down”: what is the point of teaching classes and inheritance
when students have not yet done anything interesting enough to
encapsulate or inherit from?). Some have gone so far as to start
teaching with Turing Machines. Unsurprisingly, we reject this view as
well.

What we do not take a dogmatic stance on is exactly how early state
and types should be introduced. Pyret has the usual stateful
operations. We discussed this at some length, but eventually decided
an introduction to programming _must_ teach state (hopefully in a fair
and balanced manner). Pyret also has optional annotations, so
different instructors can, depending on their preference, introduce
types at different times.

### What are some ways the educational philosophy influences the langauge?

Pyret is driven by the [How to Design Programs](http://www.htdp.org/)
(HtDP) philosophy of programming education; one could almost view it
as a language designed to make teaching from HtDP comfortable.
However, we also have our own curricular ideas that extend or run
parallel to those of HtDP, which we are steadily writing up in
[Programming and Programming Languages](http://papl.cs.brown.edu/)
(PAPL). Note that PAPL exclusively uses Pyret.

Some of our central ideas include:

* Languages should offer a rich set of values. For instance, images
  should be primitive values, fully supported by the environment. This
  improves the teaching of several things, from image-based
  composition exercises (which are often far more interesting than
  composition over numbers) to animations and games.

* Languages should offer syntactic support for as much as possible of
  the HtDP design recipe. (Pyret does not offer explicit support for
  templates, but then again we're rethinking the pedagogy of the
  template step.)

* Design recipe support includes good data definition primitives, including
  the expression of invariants.  Therefore, Pyret has support for refinements
  (which are currently checked dynamically; a future version may add static
  support, but this is not our highest priority.) In particular, by allowing
  algebraic datatypes to also be objects, Pyret offers significant flexibility
  and expressiveness.

* Students should be able to easily write examples as a precursor to
  writing code. In this regard, Pyret borrows but (we believe) syntactically
  improves upon Racket's `check-expect` family of operations with [examples and
  testing](https://www.pyret.org/docs/latest/testing.html).

* Students should easily be able to escalate from simple examples to
  sophisticated testing, such as writing test oracles.

* Equality is subtle and languages should respect its nuances. We have
  therefore carefully different kinds of equality. We believe it is
  important for students to understand the meaning of equality and its
  consequences (especially with regard to observations in the presence
  of state). Therefore, Pyret has carefully developed
  [equality primitives](https://www.pyret.org/docs/latest/equality.html).

### What next?

We are currently hard at work on three very important features:

* Support for static typing. Pyret will have a conventional type
  system with tagged unions and a type _checker_, resulting in
  straightforward type errors without the complications associated
  with type _inference_ algorithms. We have carefully designed Pyret
  to always be typeable, but our earlier type systems were not good
  enough. We're pretty happy with how this one is going.

* Tables are a critical type for storing real-world data. Pyret is
  adding linguistic and library support for working effectively with
  tables, which PAPL will use to expose students to “database”
  thinking from early on.

* Our model for interactive computation is based on the
  [“world” model](http://cs.brown.edu/~sk/Publications/Papers/Published/fffk-functional-io/). 
  We are currently revising and updating it in a few ways that will
  help it better serve our new educational programs.

On the educational side, Pyret is already used by the
[Bootstrap project](http://www.bootstrapworld.org/). We are now
developing three new curricula for Bootstrap:

* A CS1 curriculum, corresponding to a standard introduction to
  computer science, but with several twists based on our pedagogy and
  materials.

* A CS Principles curriculum, for the new US College Board Advanced
  Placement exam.

* A physics/modeling curriculum, to help teach students physics and
  modeling through the medium of programming.

If you'd like to stay abreast of our developments or get involved in
our discussions, please
[come on board](http://www.pyret.org/discuss/)!
