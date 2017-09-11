
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-walker-20151218-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.walker/2015-12-18/hu.dwim.walker-20151218-darcs.tgz";
        sha256 = "94b31cec559a30df76be80a3de5136088f05b88463bf4e4c87f36767276cd5ec";
      };
    }
