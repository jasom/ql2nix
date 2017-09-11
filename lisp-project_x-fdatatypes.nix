
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_x-fdatatypes-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/x.fdatatypes/2015-07-09/x.fdatatypes-20150709-git.tgz";
        sha256 = "9724a55158d7c3cdd8d4839acb6b42bbdc11dcbfcf2042e8015352b8ebddaa15";
      };
    }
