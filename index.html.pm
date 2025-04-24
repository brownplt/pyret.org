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
            ◊div[#:class "container"]{
                ◊div[#:class "row d-flex justify-content-center"]{
                    ◊div[#:class "col-md-6"]{
                        ◊p[#:class "example-info"]{
                            ◊(first elems)}}}
                            ◊div[#:class "row" #:style "border: 3px solid #0c46ff"]{
                                ◊div[#:id (string-append name "-frame") #:class "embed-container" #:style "height: 30em"]{}}}}))


◊div[#:class "container"]{
    ◊div[#:class "jumbotron"]{
        ◊div[#:class "row"]{
            ◊div[#:class "col-md-6"]{
                ◊img[#:class "title-logo" #:src "/site/img/pyret-banner.png"]{}
            }
            ◊div[#:class "col-md-4"]{
                ◊p{
                    Pyret is a programming language designed for
                    computing education across many contexts. It has a robust
                    web-based runtime to support access in many educational
                    settings and learning environments. Try it out below!
                }
            }
        }
    }
}

◊div[#:class "container-fluid"]{

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

◊script[#:type "module"]{
    // I think this has to be metaprogrammed, because import is syntax (can't import
    // with a value in a loop in JS)
    ◊(apply string-append (for/list ((ex examples))
        (format "import { ~a } from \"/examples/~a.js\";\n" ex ex)))
    const tabs = { ◊(string-join examples ", ") }
    Object.keys(tabs).forEach((t) => {
        const tabEl = document.querySelector(`button[data-bs-target="#${t}"]`);
        tabEl.addEventListener('shown.bs.tab', function(event) {
            if(event.target.id === `${t}-tab`) {
                const container = document.getElementById(`${t}-frame`);
                container.innerHTML = "";
                tabs[t](container);
            }
        });
    });
    physics(document.getElementById("physics-frame")); // start with the active one active (change based on deafult)
}
