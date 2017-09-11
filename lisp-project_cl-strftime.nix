
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-strftime-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-strftime/2016-03-18/cl-strftime-20160318-git.tgz";
        sha256 = "4ada217a95f33df30c56c397fe2eab275241b7d93ef7fbff3ab574a588d261c7";
      };
    }
