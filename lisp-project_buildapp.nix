
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_buildapp-1.5.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/buildapp/2015-12-18/buildapp-1.5.6.tgz";
        sha256 = "53b8b94cf6d32eb367ac08c306283e37e46c1985fd9d1272b155c87e3c104e45";
      };
    }
