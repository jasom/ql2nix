
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_macrodynamics-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/macrodynamics/2017-06-30/macrodynamics-20170630-git.tgz";
        sha256 = "41476a880389f328990863412405db68bbfc1780752dfb74195e3e602979a4d5";
      };
    }
