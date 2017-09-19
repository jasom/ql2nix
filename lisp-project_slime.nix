
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_slime-v2.20";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/slime/2017-08-30/slime-v2.20.tgz";
        sha256 = "46b0718837d876abde202cedfa8e484a6cf495f2d07dd426df6b3ad671f58266";
      };
    }
