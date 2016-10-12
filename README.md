# compile-demo
Most of the work I've done is private and under NDA, so most of the code that I
could show is from more than 5 years ago and doesn't show my current skill
level. This repository is meant to be a code sample for potential employers or
clients so they can see how I work and how I solve problems in a web
application.

The usage information you'd normally find in the README can be found in
[USAGE.md](./USAGE.md).

## Principles

- I don't believe that just writing tests first necessarily leads to good
  design. An example of this is [PR
  #2](https://github.com/jacobthemyth/compile-demo/pull/2), in which I write
  tests first, but end up with a fairly nasty, procedural helper in
  [application_helper.rb](https://github.com/jacobthemyth/compile-demo/blob/860749c9e8c1a235a59bf820a6eaafd4e7364c84/app/helpers/application_helper.rb).
  This is a good example of the difference between Test First Development and
  Test Driven Design, I suppose.
- Speaking of nasty, procedural helpers, in general I actually try to avoid
  helpers for the reason that they are often abused as a junk-drawer for code.
  Instead, I prefer splitting my code up into further layers like a Presenter
  layer (coming soon) or pure application logic, sometimes called Service
  classes, that I like to put in `/models` when it makes sense. See [PR
  #25](https://github.com/jacobthemyth/compile-demo/pull/25), or the end result
  in [app/models/html_document.rb](./app/models/html_document.rb), for an
  example of moving code from a helper to a Plain Old Ruby Object.

## Notable pull requests

- In [#2](https://github.com/jacobthemyth/compile-demo/pull/2), I followed a
  pretty strict TDD loop and made a commit for every change that a failing test
  led me to make. It's probably a little tedious to read through, but
  demonstrates how I like to write end-to-end tests first, then follow a
  outside-in TDD process to implement the feature.

