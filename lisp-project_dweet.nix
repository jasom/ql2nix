
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dweet-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dweet/2014-12-17/dweet-20141217-git.tgz";
        sha256 = "050fdc63515fac1702ec169ef0122052dfad64df74297d7e15d38f8bd206dbec";
      };
    }
