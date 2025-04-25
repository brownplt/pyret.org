#lang pollen

◊(require racket/string)
◊(require racket/list)
◊(require pollen/tag)
◊(require (only-in pollen/template ->html))

◊(define examples (list "physics" "images"))
◊(define physics-doc (get-doc "examples/physics.html.pm"))
◊(define images-doc (get-doc "examples/images.html.pm"))
◊(define-tag-function (example-pane attrs elems)
    (let ()
        (define name (cadr (assoc 'name attrs)))
        (define active (assoc 'active attrs))
        (define active-show (if active " show active" ""))
        ◊div[#:class (string-append "tab-pane fade" active-show) #:id name #:role "tabpanel" #:aria-labelled-by (string-append name "-tab")]{
                       ◊p[#:class "example-info"]{
                            ◊(first elems)}}))

◊(define-tag-function (center6 attrs elems)
    (let ()
        (eprintf "~a" elems)

        ◊div[#:class "row d-flex justify-content-center"]{
            ◊div[#:class "col-md-6"]{ ◊(apply @ elems) }}))


◊div[#:class "container"]{
    ◊div[#:class "jumbotron"]{
        ◊div[#:class "row d-flex justify-content-center"]{
            ◊div[#:class "col-md-4"]{
                ◊img[#:class "title-logo" #:src "/site/img/pyret-banner.png"]{}
            }
            ◊div[#:class "col-md-6"]{
                ◊p{
                    Pyret is a programming language designed for
                    computing education across many contexts. It has a robust
                    web-based runtime to support access in many educational
                    settings and learning environments. Check out the examples
                    below and learn more about its uses for:
                }
                ◊p{
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade" #:href "#devs"]{K-12 Teachers}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade" #:href "#devs"]{Undergrad Instructors}
                    ◊a[#:class "btn btn-primary btn-m hvr-border-fade" #:href "#devs"]{Developers}
                }
            }
        }
    }
}

◊div[#:class "container-fluid"]{

    ◊a[#:name "examples"]{}
    ◊h2{Examples}


    ◊div[#:class "row d-flex justify-content-center"]{
        ◊div[#:class "col-md-6 tab-box"]{
            ◊ul[#:class "nav nav-pills" #:id "examplesTabs" #:role "tablist"]{
                ◊li[#:class "nav-item" #:role "presentation"]{
                    ◊button[#:class "nav-link active" #:id "physics-tab" #:data-bs-toggle "pill" #:data-bs-target "#physics" #:type "button" #:role "tab" #:aria-controls "physics" #:aria-selected "true"]{Physics}
                }
                ◊li[#:class "nav-item" #:role "presentation"]{
                    ◊button[#:class "nav-link" #:id "images-tab" #:data-bs-toggle "pill" #:data-bs-target "#images" #:type "button" #:role "tab" #:aria-controls "images" #:aria-selected "false"]{Images}
                }
            }
            ◊div[#:class "tab-content" #:id "examplesTabsContent"]{
                ◊example-pane[#:name "physics" #:active #t]{◊physics-doc}
                ◊example-pane[#:name "images"]{◊images-doc}
            }
        }
    }

    ◊div[#:class "row" #:style "border: 3px solid #0c46ff"]{
        ◊div[#:id "examples-frame" #:class "embed-container" #:style "height: 30em"]{}}

}

◊div[#:class "container-fluid"]{
    ◊a[#:name "k-12"]{}
    ◊h2{For K-12 Teachers}

    ◊center6{
        FILL all about bootstrap, one-click, web-based, CSP projects
    }
}

◊div[#:class "container-fluid"]{
    ◊a[#:name "ugrad"]{}
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
    import { makeEmbed } from "/node_modules/pyret-embed/dist/pyret.js";    // I think this has to be metaprogrammed, because import is syntax (can't import

    // with a value in a loop in JS)
    ◊(apply string-append (for/list ((ex examples))
        (format "import { ~a } from \"/examples/~a.js\";\n" ex ex)))

    const startFrameContainer = document.getElementById("examples-frame")   

    const embed = await makeEmbed('examples-editor', startFrameContainer, "/node_modules/pyret-embed/dist/build/web/editor.embed.html#footerStyle=hide&warnOnExit=false");
    embed.sendReset(physics);

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
