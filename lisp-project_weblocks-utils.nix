
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_weblocks-utils-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/weblocks-utils/2017-01-24/weblocks-utils-20170124-git.tgz";
        sha256 = "d695e05cd4fc4f1587c924af5b3203dea7daf73b5e57748bc4fe374fcd5710aa";
      };
    }
