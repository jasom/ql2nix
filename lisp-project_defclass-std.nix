
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defclass-std-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defclass-std/2015-08-04/defclass-std-20150804-git.tgz";
        sha256 = "24cf9fe473b3122ee96067c5bcb8c23d12f8741375ab0d14359b7ecfb6b4282e";
      };
    }
