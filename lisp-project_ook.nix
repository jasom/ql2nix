
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ook-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ook/2017-01-24/ook-20170124-git.tgz";
        sha256 = "eb0fbdf64aff02f426408e1f35fb716532cdfff399c97a263e37f0426f164f87";
      };
    }
