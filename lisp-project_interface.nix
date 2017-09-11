
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_interface-20151031-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/interface/2015-10-31/interface-20151031-hg.tgz";
        sha256 = "9fb564e440e2b4c2f3ee0c0b73b883971b0c8410f43334e92ae0571793bb7f1b";
      };
    }
