#lang pollen

Pyret's ◊a[#:href
"https://pyret.org/docs/latest/numbers.html#(part._numbers)"]{number system}
supports ◊em{exact rational} arithmetic for many operations.  This avoids having
floating point as a curricular dependency early on. When approximations become
inevitable, there is explicit syntax and rendering to work with them in the form
of ◊a[#:href
"https://pyret.org/docs/latest/numbers.html#%28part._numbers_.Roughnum%29"]{Roughnum}s.
These come with ◊a[#:href
"https://pyret.org/docs/latest/equality.html#(part._s~3aroughnum-equality)"]{specific
behavior} and ◊a[#:href
"https://pyret.org/docs/latest/testing.html#%28part._testing_is-roughly%29"]{testing
support} for working with floating point.
