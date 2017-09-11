
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_evol-20101006-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/evol/2010-10-06/evol-20101006-git.tgz";
        sha256 = "9c78804df65cdbcab1bfe112dc4ee6c80387481c0f722c27dac79e399a82e315";
      };
    }
