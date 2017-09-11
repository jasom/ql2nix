
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-timeout-20130813-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-timeout/2013-08-13/trivial-timeout-20130813-darcs.tgz";
        sha256 = "89ebf827de0b3107d9eed2dcef10c916ba67df27f3f86a9908c1bc7f8b392694";
      };
    }
