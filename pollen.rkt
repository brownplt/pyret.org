#lang racket/base

(module setup racket
  (provide (all-defined-out))
  (define (omitted-path? p) 
    (string-suffix? (path->string p) "site")))
