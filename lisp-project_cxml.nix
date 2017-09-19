
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cxml-20110619-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cxml/2011-06-19/cxml-20110619-git.tgz";
        sha256 = "d38bbad4b2d8f519f9e13402cd322ceb8a38934d4b4d82e2571a9f9bacd76612";
      };
    }
