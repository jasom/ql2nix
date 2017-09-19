
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mgl-pax-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mgl-pax/2015-12-18/mgl-pax-20151218-git.tgz";
        sha256 = "a0828f43e9a28e283ed664d548c5389e6685a0e6805bc08980c234ad76479217";
      };
    }
