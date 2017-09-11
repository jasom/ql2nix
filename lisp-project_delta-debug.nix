
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_delta-debug-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/delta-debug/2016-03-18/delta-debug-20160318-git.tgz";
        sha256 = "cf0e4981ec91040aa47e87dca476f4eff93b56aacb84d40956891f59cb81359b";
      };
    }
