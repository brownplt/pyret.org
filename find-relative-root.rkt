#lang racket

#|
Common assets like CSS and JS files will be in /~sk/. We'll call this the "relative root".

We don't have a clear location for this, because that path doesn't exist on the local server.
We could try to put everything under /people/sk/, but that's (at least) an ugly solution.

Another option is to *calculate* the relative root as a relative path from the current location.
This makes the files robust under many serving locations (in practice, two…).

Fortunately, Pollen's `◊here` (a symbol!, not a string or path) includes the full path name.
We can therefore use that to compute where the "root" is.

Note: this code may be slightly fragile; it doesn't consider all the possible return values from split-path.
So an error could be thrown in unusual situations.
|#

; Let's not export ◊ names and play with fire…
(provide [rename-out (◊here->relative-path here->relative-path)])

(require rackunit)

(define (◊here->relative-path s)
  (define p (string->path (symbol->string s)))
  (define-values (prefix-path file _) (split-path p))
  (cond
    [(eq? prefix-path 'relative)
     "."]
    [(path? prefix-path)
     (string-join (map (λ (_) "..") (explode-path prefix-path)) "/")]
    [else (error 'here-string->relative-path "~a not recognized" prefix-path)]))

; We leave the terminal "/" so that we can write it in the HTML file, improving its readability.

(define H ◊here->relative-path)
(check-equal? (H 'index.html)                               ".")
(check-equal? (H 'Publications/index.html)                  "..")
(check-equal? (H 'Work/PCs/index.html)                      "../..")
(check-equal? (H 'Publications/Papers/Published/index.html) "../../..")
