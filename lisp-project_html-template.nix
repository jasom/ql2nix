
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_html-template-0.9.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/html-template/2015-06-08/html-template-0.9.2.tgz";
        sha256 = "4ce23f410d0aca9fdcdda8b16ec5376ffe44b969929e6239fb6bee1b67052392";
      };
    }
