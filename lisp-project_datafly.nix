
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_datafly-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/datafly/2016-02-08/datafly-20160208-git.tgz";
        sha256 = "8b39f221b3985a5abb1f4fa90b8be0491946230bb7de189bb69b6c8f9a73ca8e";
      };
    }
