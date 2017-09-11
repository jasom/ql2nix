
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-stefil-20170403-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.stefil/2017-04-03/hu.dwim.stefil-20170403-darcs.tgz";
        sha256 = "36653195feb7ac27d2e8a5bf98628772c9fb3b988a68ac12e9ab30d7c1d239c7";
      };
    }
