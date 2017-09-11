
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_puri-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/puri/2015-09-23/puri-20150923-git.tgz";
        sha256 = "0a0784c4d592733c1232fdee1074e9898a091359da142985a44b9528bff02a25";
      };
    }
