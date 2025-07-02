#lang racket/base

(module setup racket
  (provide (all-defined-out))
  (define (omitted-path? p) 
    (or (string-suffix? (path->string p) "site")
        (string-suffix? (path->string p) "typescript"))))

(provide link/new-tab)

(define (link/new-tab url . bodies)
  `(a ([href ,url]
       [target "_blank"])
      ,@bodies))
