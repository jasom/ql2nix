
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_with-setf-release-quicklisp-29deacde-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/with-setf/2017-07-25/with-setf-release-quicklisp-29deacde-git.tgz";
        sha256 = "0377797a57f8d4e05f82af360f1db14748cf8350d7f407be65d5f8dd674db383";
      };
    }
