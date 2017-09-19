
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_talcl-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/talcl/2017-02-27/talcl-20170227-git.tgz";
        sha256 = "64d012963ee0bec9523144da59fc6a52e61191523f923e0549d30819deefb076";
      };
    }
