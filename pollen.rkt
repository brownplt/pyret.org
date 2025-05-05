#lang racket/base

(module setup racket
  (provide (all-defined-out))
  (define (omitted-path? p) 
    (or (string-suffix? (path->string p) "site")
        (string-suffix? (path->string p) "typescript"))))
