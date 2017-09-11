
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modf-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modf/2015-06-08/modf-20150608-git.tgz";
        sha256 = "cf2dca4710f61895ebf8617e71c9bbd15130c782431760b654f7f45e826bf31e";
      };
    }
