
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_x-let-star-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/x.let-star/2015-07-09/x.let-star-20150709-git.tgz";
        sha256 = "a29eede8f983b86d9410a03f51192958d3c18a5579f676398b845120030ffe9a";
      };
    }
