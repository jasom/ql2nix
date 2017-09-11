
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_org-davep-dict-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/org-davep-dict/2012-04-07/org-davep-dict-20120407-git.tgz";
        sha256 = "531dae7170ec8bdfc70b4618400d55f94dd5df6e2046f30c5f9f828885dc107a";
      };
    }
