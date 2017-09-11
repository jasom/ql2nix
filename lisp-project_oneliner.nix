
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_oneliner-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/oneliner/2013-10-03/oneliner-20131003-git.tgz";
        sha256 = "50bb2cb678b1584158ebd49f29e0629d47ab8560b8272416bda3ecfe045145fc";
      };
    }
