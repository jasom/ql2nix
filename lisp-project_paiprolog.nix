
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_paiprolog-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/paiprolog/2016-04-21/paiprolog-20160421-git.tgz";
        sha256 = "5598d0ec1b3354cebc40fbcf51d54cfce72f491a176126b8c8946a418e319b89";
      };
    }
