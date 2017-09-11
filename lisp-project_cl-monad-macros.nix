
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-monad-macros-20110619-svn";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-monad-macros/2011-06-19/cl-monad-macros-20110619-svn.tgz";
        sha256 = "49641b82d977887d2a4852770d9b4ad34d306bf4c61a7738493b41b1f61af5b9";
      };
    }
