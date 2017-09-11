
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-png-0.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-png/2010-10-06/cl-png-0.6.tgz";
        sha256 = "2066132773162943cd5530032a67e0ca89d78794672e81eb5797e6bd30ded836";
      };
    }
