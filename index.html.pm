#lang pollen

◊(require racket/string racket/set)
◊(require racket/list)
◊(require pollen/tag)

◊(define-meta title "The Pyret Programming Language")
◊(define-meta rel-path ".")

◊(define by-category
    #hash(
        ("cat-general" . (("testing" . "Testing") ("images" . "Images")))
        ("cat-k12" . (("rational" . "Rationals") ("images" . "Images") ("data_science" . "Data Science") ("physics" . "Physics")))
        ("cat-ugrad" . (("testing" . "Testing") ("data" . "Data Structures") ("images" . "Images")))
        ("cat-beyond" . (("testing" . "Testing") ("data" . "Data Structures")))))

◊(define all-examples
    (set->list (list->set (apply append (map (lambda (examples) (map car examples)) (hash-values by-category))))))
◊(define default-example "testing")

◊(define categories '("cat-general" "cat-k12" "cat-ugrad" "cat-beyond"))
◊(define categories-names '("General" "K-12" "Undergraduate" "Beyond"))

◊(define-tag-function (example-pane attrs elems)
    (let ()
        (define id (cadr (assoc 'id attrs)))
        (define name (cadr (assoc 'name attrs)))
        (define active (assoc 'active attrs))
        (define active-show (if active " show active" ""))
        ◊div[#:class (string-append "tab-pane" active-show) #:id id #:example-name name #:role "tabpanel" #:aria-labelled-by (string-append name "-tab")]{
                       ◊p[#:class "example-info"]{
                            ◊(first elems)}}))

◊(define-tag-function (center6 attrs elems)
    ◊div[#:class "row d-flex justify-content-center"]{
        ◊div[#:class "col-md-6"]{ ◊(apply @ elems) }})

◊(define (nav-pills id ids names)
    ◊@[
        ◊ul[#:class "nav nav-pills" #:id id #:role "tablist"]{
            ◊li[#:class "nav-item" #:role "presentation"]{
                ◊button[
                    #:class "nav-link active"
                    #:id (format "~a-tab" (first ids))
                    #:data-bs-toggle "pill"
                    #:data-bs-target (format "#~a" (first ids))
                    #:type "button"
                    #:role "tab"
                    #:aria-controls (first ids)
                    #:aria-selected "true"]{◊(first names)}
            }
            ◊(for/splice ((ex (rest ids)) (name (rest names)))
                ◊li[#:class "nav-item" #:role "presentation"]{
                    ◊button[
                        #:class "nav-link"
                        #:id (format "~a-tab" ex)
                        #:data-bs-toggle "pill"
                        #:data-bs-target (format "#~a" ex)
                        #:type "button"
                        #:role "tab"
                        #:aria-controls ex
                        #:aria-selected "false"]{◊name}
                })
        }
    ])

◊(define (examples-tabs examples-ids examples examples-names)
    ◊@[
        ◊div[#:class "row d-flex justify-content-center examples-pills"]{
            ◊div[#:class "col-md-8 nav-border"]{
                ◊ul[#:class "nav nav-pills" #:id "examplesTabs" #:role "tablist"]{
                    ◊nav-pills["examplesTabs" examples-ids examples-names]
                }
            }
        }
        ◊div[#:class "row d-flex justify-content-center examples-tab-top"]{
            ◊div[#:class "col-md-8 tab-box"]{
                ◊div[#:class "tab-content" #:id "examplesTabsContent"]{
                    ◊example-pane[#:active #t #:id (first examples-ids) #:name (first examples)]{◊(example-doc (format "examples/~a.html.pm" (first examples)))}
                    ◊(for/splice ((ex (rest examples)) (id (rest examples-ids)))
                        ◊example-pane[
                            #:name ex
                            #:id id]{
                                ◊(example-doc (format "examples/~a.html.pm" ex))
                            })
                }
            }
        }
    ])

◊(define (example-doc path)
    (apply @ (rest (get-doc path))))

◊(define autograders
    ◊li{Education requires more than software and books; it
    also requires tools like autograders. We provide them!})

◊(define no-install
    ◊li{Want to get your students going from day 1? Do you
    have students who have had minimal computing experience,
    and do you lose frustrating hours (that make them feel
    inadequate) due to installers and platforms and what not?
    Pyret runs entirely in your browser with no installation
    at all; indeed, you're running Pyret right above on this
    very page. Pyret is built atop an advanced technology
    stack
    [◊a[#:href "https://cs.brown.edu/~sk/Publications/Papers/Published/bnpkg-stopify/"]{1},
    ◊a[#:href "https://cs.brown.edu/~sk/Publications/Papers/Published/yk-whalesong-racket-browser/"]{2}]
    that makes this a pleasant experience while avoiding the
    costs and burdens of maintaining servers. Our view is that
    the crippling limitations of a platform (like the browser)
    must not become an impediment to education; rather, we
    should bend the platform to our needs. That is, the medium
    should not become the message.})

◊div[#:class "container"]{
    ◊div[#:class "jumbotron"]{
        ◊div[#:class "row d-flex justify-content-center"]{
            ◊div[#:class "col-md-2"]{
                ◊img[#:class "title-logo" #:src "./img/pyret-logo.png"]{}
            }
            ◊div[#:class "col-md-4"]{
                ◊p{
                    Pyret is a programming language designed for
                    computing education across many contexts, with a robust
                    web-based runtime and programming environment
                    to support broad access. Several curricula have been
                    co-designed with Pyret at many levels.
                }
                ◊p{
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade" #:href "#examples"]{Examples}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade" #:href "#k12"]{K-12}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade" #:href "#ugrad"]{Undergraduate}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade" #:href "#devs"]{Developers}
                }
            }
        }
    }
}
◊div[#:class "container-fluid"]{

    ◊a[#:name "examples" #:style "scroll-margin-top: 100px"]{}
    ◊h2{Pyret in Action}
    ◊div[#:class "row d-flex justify-content-center"]{
        ◊div[#:class "col-md-8 d-flex justify-content-center align-items-center"]{
            ◊space[#:style "padding-right: 1em;"]{Choose a category:}
            ◊nav-pills["categoryTabs" categories categories-names]
        }
    }

    ◊div[#:class "row d-flex justify-content-center categories-tab-top"]{
        ◊div[#:class "tab-content" #:id "categoriesTabContent"]{
            ◊(for/splice ((cat categories))
                ◊(let ()
                    ◊(define active-show (if (equal? cat (first categories)) " active show" ""))
                    ◊(define examples (map car (hash-ref by-category cat)))
                    ◊(define examples-ids (map (lambda (ex) (format "~a-~a" cat ex)) examples))
                    ◊(define examples-names (map cdr (hash-ref by-category cat)))
                    ◊(eprintf "~a" examples-names)
                    ◊div[#:class (string-append "tab-pane" active-show) #:id cat #:role "tabpanel" #:aria-labelled-by (string-append cat "-tab")]{
                        ◊examples-tabs[examples-ids examples examples-names]
                    })
                )
        }
    }

    ◊div[#:class "row embed-row"]{
        ◊div[#:id "examples-frame" #:class "embed-container" #:style "height: 30em"]{}}

}


◊div[#:class "container-fluid"]{
    ◊a[#:name "k12" #:style "scroll-margin-top: 100px"]{}
    ◊h2{For K–12 (Secondary School) Educators}

    ◊center6{

Pyret comes with numerous resources that help you create or use great
courses or modules:

◊ul{

◊li{Our partners at ◊a[#:href "https://www.bootstrapworld.org/"]{Bootstrap}
are the leading designers of ◊em{integrated} computing curricula. All
the Bootstrap curricula build primarily atop Pyret. Bootstrap covers
numerous areas (with ties to algebra, data science, AI, physics, and
more) and provides comprehensive materials that have been tested in
thousands of classrooms and by tens of thousands of students every
year. Bootstrap is also, by design, ◊em{modular}: you don't have to
buy into a whole course, but can instead choose modules that fit best
with what you're already teaching. Head over to Bootstrap to learn more!}

◊no-install

◊autograders

}

[JOE: what are "one-click, web-based, CSP projects"?]

    }
}

◊div[#:class "container-fluid"]{
    ◊a[#:name "ugrad" #:style "scroll-margin-top: 100px"]{}
    ◊h2{For University (Tertiary) Educators}

    ◊center6{
Pyret comes with numerous resources that help you create a great course:

◊ul{
            ◊li{Our book, ◊a[#:href "https://dcic-world.org/"]{◊em{Data-Centric Introduction to Computing}} (DCIC),
                gives you a modern introduction to computing education that addresses many of the problems
                that affect current curricula. You can read our
                ◊a[#:href "https://cs.brown.edu/~sk/Publications/Papers/Published/kf-data-centric/"]{critique}
                that inspired the book. You can also see some of the research
                [◊a[#:href "https://cs.brown.edu/~sk/Publications/Papers/Published/fkt-teach-scope-mut/"]{1},
                ◊a[#:href "https://cs.brown.edu/~sk/Publications/Papers/Published/lkft-switch-fun-lang/"]{2},
                ◊a[#:href "https://cs.brown.edu/~sk/Publications/Papers/Published/lk-smol-tutor/"]{3}]
                that has driven its design and content.}

            ◊li{In particular, DCIC takes the position — driven by a
            significant body of literature in educational and
            cognitive science — that students learn programming better
            when they can compare and contrast related but different
            things. Thus DCIC teaches not one but two programming
            languages: Python in addition to Pyret. But the
            progression from Pyret to Python is (a) staged carefully
            to minimize difficulties, and (b) includes seeing them
            side-by-side. Pyret, in turn, is designed to facilitate
            this kind of comparison with Python.}

            ◊no-install

	    ◊autograders

         }

    }
}

◊div[#:class "container-fluid"]{

    ◊a[#:name "devs"]{}
    ◊h2{For Developers}

    ◊center6{

        ◊h3{Visual Studio Code and Github}

        ◊p{Pyret has a ◊a[#:href
        "https://marketplace.visualstudio.com/items?itemName=PyretProgrammingLanguage.pyret-parley"]{Visual
        Studio Code extension} that opens files in the same visual editor as the
        examples above. It works in Github Codespaces, github.dev, and desktop
        Visual Studio Code.}

        ◊h3{Embedding Pyret}

        ◊p{
            All the examples above embed an instace of Pyret through its ◊a[#:href
            "https://github.com/jpolitz/pyret-embed-examples"]{embedding library}.

            You can embed Pyret on your own websites and projects by
            installing that ◊code{npm} package, which has an API for controlling and
            listening to the embedded instance.

            You can embed from our copies of the compiler and runtime, or serve
            your own. No Pyret code runs on the server: it's strictly a bundle
            of client-side HTML, CSS, and JavaScript (we've done ◊a[#:href
            "https://cs.brown.edu/~sk/Publications/Papers/Published/bnpkg-stopify/"]{a
            little bit of engineering} in this space to make this possible).
        }

        ◊h3{Command-line Pyret}

        ◊p{
            Pyret runs from the command line via the ◊code{◊a[#:href
            "https://www.npmjs.com/package/pyret-npm"]{pyret-npm}} package.
            Nearly all libraries (including images) run the same offline and
            in-browser. This can be especially important for grading student
            code submissions in an automated way. THIS DOCUMENT (fill) says more
            about it.
        }

        ◊h3{Programming Assignments and Starter Code}

        ◊p{
            Pyret has specific libraries and features (FILL: url-file tutorial,
            Github example) for creating and deploying starter code for students
            seamlessly. We developed these features and workflows in our own
            courses, with our own TAs, and for our own curricula.
        }

    }

}

◊script[#:type "module"]{
console.log("Welcome to the pyret.org console!");
console.log("It can be a bit noisy in here because the embedded instances log some information (which you might be interested in – have a look!)")
console.log("You may enjoy trying out some of the API affordances right from here.");
console.log("For example, you can run `window.pyretEmbed.sendReset({ definitionsAtLastRun: '\"Hello, api!\"', interactionsSinceLastRun: [ ], editorContents: '\"Hello, api!\"', replContents: '' });`");
console.log("Noisy application logs below......");
console.log("-----------------------------------");
}

◊script[#:type "module"]{
    import { makeEmbed } from "./node_modules/pyret-embed/dist/pyret.js";

    // I think this has to be metaprogrammed, because import is syntax (can't import
    // with a value in a loop in JS)
    ◊(for/splice ((ex all-examples))
        (format "import { ~a } from \"./examples/~a.js\";\n" ex ex))

    const startFrameContainer = document.getElementById("examples-frame")   

    const embed = await makeEmbed('examples-editor', startFrameContainer, "./node_modules/pyret-embed/dist/build/web/editor.embed.html#footerStyle=hide&warnOnExit=false");
    embed.sendReset(◊default-example);
    window.pyretEmbed = embed;

    const tabs = { ◊(string-join all-examples ", ") }
    const catElements = document.querySelectorAll(`#categoryTabs [data-bs-toggle="pill"]`);
    catElements.forEach(tabElement => {
        tabElement.addEventListener('show.bs.tab', (event) => {
            const target = document.querySelector(tabElement.attributes["data-bs-target"].value);
            const exampleElt = target.querySelector(`.active`);
            exampleElt.dispatchEvent(new Event("show.bs.tab"));
        });
    });
    const tabElements = document.querySelectorAll(`#examplesTabs [data-bs-toggle="pill"]`);
    tabElements.forEach(tabElement => {
        tabElement.addEventListener('show.bs.tab', (event) => {
            const target = document.querySelector(tabElement.attributes["data-bs-target"].value);
            if(target.attributes["example-name"]) {
                embed.sendReset(tabs[target.attributes["example-name"].value]);
            }
        });
    });
}
