
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_intel-hex-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/intel-hex/2016-03-18/intel-hex-20160318-git.tgz";
        sha256 = "e24e11314a1692cb84ef5af9195d782d507bdd18945cbd3b0a2a04ea5bb0edcc";
      };
    }
