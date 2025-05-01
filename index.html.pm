#lang pollen

◊(require racket/string)
◊(require racket/list)
◊(require pollen/tag)

◊(define examples (list "testing" "rational" "images" "data" "physics"))
◊(define examples-names( list "Testing" "Numbers" "Images" "Data Structures" "Physics"))

◊(define-tag-function (example-pane attrs elems)
    (let ()
        (define name (cadr (assoc 'name attrs)))
        (define active (assoc 'active attrs))
        (define active-show (if active " show active" ""))
        ◊div[#:class (string-append "tab-pane fade" active-show) #:id name #:role "tabpanel" #:aria-labelled-by (string-append name "-tab")]{
                       ◊p[#:class "example-info"]{
                            ◊(first elems)}}))

◊(define-tag-function (center6 attrs elems)
    ◊div[#:class "row d-flex justify-content-center"]{
        ◊div[#:class "col-md-6"]{ ◊(apply @ elems) }})

◊(define (nav-pills ids names)
    ◊@[
        ◊ul[#:class "nav nav-pills" #:id "examplesTabs" #:role "tablist"]{
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

◊(define (examples-tabs examples examples-names)
    ◊@[
        ◊div[#:class "row d-flex justify-content-center"]{
            ◊div[#:class "col-md-8 nav-border"]{
                ◊ul[#:class "nav nav-pills" #:id "examplesTabs" #:role "tablist"]{
                    ◊nav-pills[examples examples-names]
                }
            }
        }
        ◊div[#:class "row d-flex justify-content-center tab-top"]{
            ◊div[#:class "col-md-8 tab-box"]{
                ◊div[#:class "tab-content" #:id "examplesTabsContent"]{
                    ◊example-pane[#:active #t #:name (first examples)]{◊(get-doc (format "examples/~a.html.pm" (first examples)))}
                    ◊(for/splice ((ex (rest examples)))
                        ◊example-pane[#:name ex]{◊(get-doc (format "examples/~a.html.pm" ex))})
                }
            }
        }
    ])

◊div[#:class "container"]{
    ◊div[#:class "jumbotron"]{
        ◊div[#:class "row d-flex justify-content-center"]{
            ◊div[#:class "col-md-2"]{
                ◊img[#:class "title-logo" #:src "./site/img/pyret-logo.png"]{}
            }
            ◊div[#:class "col-md-4"]{
                ◊p{
                    Pyret is a programming language designed for
                    computing education across many contexts, with a robust
                    web-based runtime and programming environment
                    to support broad access. Several curricula have been
                    co-designed with Pyret at many levels.
                }
            }
        }
    }
}
◊div[#:class "container-fluid"]{

    ◊a[#:name "k-12" #:style "scroll-margin-top: 100px"]{}
    ◊h2{Pyret in Action}
    ◊div[#:class "row d-flex justify-content-center"]{
        ◊div[#:class "col-md-6"]{
            ◊p{
                This editor shows some sample programs from various
                curricula that you can try out directly on this page! For
                using Pyret with your students or on your own, check out
                ◊a[#:href "#running-pyret"]{Ways to Run Pyret}.
            }
        }
    }
    ◊div[#:class "row d-flex justify-content-center"]{
        ◊div[#:class "col-md-8 d-flex justify-content-center"]{
            ◊p{
                ◊span{
                    Examples for:
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade"]{General}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade"]{K-12}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade"]{University}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade"]{Beyond}
                }
            }
        }
    }

    ◊examples-tabs[examples examples-names]

    ◊div[#:class "row embed-row"]{
        ◊div[#:id "examples-frame" #:class "embed-container" #:style "height: 30em"]{}}

}


◊div[#:class "container-fluid"]{
    ◊h2{For K-12 Teachers}

    ◊center6{
        FILL all about bootstrap, one-click, web-based, CSP projects
    }
}

◊div[#:class "container-fluid"]{
    ◊a[#:name "ugrad" #:style "scroll-margin-top: 100px"]{}
    ◊h2{For Undergraduate Instructors}

    ◊center6{
        FILL all about DCIC, one-click, no installation, pathway to Python, autograding, etc
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
    ◊(for/splice ((ex examples))
        (format "import { ~a } from \"./examples/~a.js\";\n" ex ex))

    const startFrameContainer = document.getElementById("examples-frame")   

    const embed = await makeEmbed('examples-editor', startFrameContainer, "./node_modules/pyret-embed/dist/build/web/editor.embed.html#footerStyle=hide&warnOnExit=false");
    embed.sendReset(◊(first examples));
    window.pyretEmbed = embed;

    const tabs = { ◊(string-join examples ", ") }
    Object.keys(tabs).forEach((t) => {
        const tabEl = document.querySelector(`button[data-bs-target="#${t}"]`);
        tabEl.addEventListener('shown.bs.tab', function(event) {
            if(event.target.id === `${t}-tab`) {
                const container = document.getElementById(`${t}-frame`);
                embed.sendReset(tabs[t]);
            }
        });
    });
}
