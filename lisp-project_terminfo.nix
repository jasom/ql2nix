
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_terminfo-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/terminfo/2015-08-04/terminfo-20150804-git.tgz";
        sha256 = "b7c36c62537b7879d6f2ebbdee7058a2fe24de58dd2979b91091d59d6cad84f9";
      };
    }
