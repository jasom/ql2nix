
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-dgen-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-dgen/2017-07-25/gamebox-dgen-20170725-git.tgz";
        sha256 = "7ed72094b5822d19a8bfcd6490dd8507e2ddf7c3ca3edac4d0b35af1e5075097";
      };
    }
