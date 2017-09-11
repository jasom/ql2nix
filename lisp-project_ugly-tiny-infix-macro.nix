
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ugly-tiny-infix-macro-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ugly-tiny-infix-macro/2016-08-25/ugly-tiny-infix-macro-20160825-git.tgz";
        sha256 = "8a6e840039fe0891fcee70e9c3fcd8ac731d8605bccd83762bf6b40a33a959bf";
      };
    }
