
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_inquisitor-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/inquisitor/2017-07-25/inquisitor-20170725-git.tgz";
        sha256 = "2d975d7c0676f63e41bbc74a3feee0aa7389f01e28b453dc2b7eaabee71932a2";
      };
    }
