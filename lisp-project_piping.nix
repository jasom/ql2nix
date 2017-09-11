
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_piping-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/piping/2017-06-30/piping-20170630-git.tgz";
        sha256 = "1f9b1d657d57c262d0fdccca37fba0197ad448bac2e5d4b0e96bd4f55432f533";
      };
    }
