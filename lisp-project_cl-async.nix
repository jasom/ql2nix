
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-async-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-async/2016-08-25/cl-async-20160825-git.tgz";
        sha256 = "ea264059afabbb25a6ea72effb90f78c191a9f07f6d71bf5f8bfe69ff8369d80";
      };
    }
