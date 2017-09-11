
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_acclimation-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/acclimation/2017-01-24/acclimation-20170124-git.tgz";
        sha256 = "04e677389a71b7f8ecfa77b17107024df76d444f819bdc6e65bcab7a873f6945";
      };
    }
