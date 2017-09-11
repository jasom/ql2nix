
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parse-declarations-20101006-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parse-declarations/2010-10-06/parse-declarations-20101006-darcs.tgz";
        sha256 = "2d73e5edc275182f3f327ed5db428b2692de466089cf62f244a231e524580565";
      };
    }
