
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pop-20110418-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pop/2011-04-18/cl-pop-20110418-http.tgz";
        sha256 = "ccf1668abf628bec4acd534d205ec24e4a79403d5064f1f43ff93c6fb698efd3";
      };
    }
