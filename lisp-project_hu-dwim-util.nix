
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-util-20170630-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.util/2017-06-30/hu.dwim.util-20170630-darcs.tgz";
        sha256 = "d066fca5498ed4b357802058a2e7b32af152637cb69263bf63895629e314588b";
      };
    }
