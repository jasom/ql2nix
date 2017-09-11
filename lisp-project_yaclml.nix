
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_yaclml-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/yaclml/2017-06-30/yaclml-20170630-git.tgz";
        sha256 = "bd3ea40461e72ba789256ac0c5f1b4671841e8cb8e30ab347f12e84fd5b1c9b0";
      };
    }
