
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-6502-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-6502/2015-09-23/cl-6502-20150923-git.tgz";
        sha256 = "c4042b3b0a061876a034a2f0155335777c7d1f31bc86aa5c5526554c4b8bf5d2";
      };
    }
