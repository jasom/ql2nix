
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_south-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/south/2017-08-30/south-20170830-git.tgz";
        sha256 = "06003a6f33063a0bdb9586d6e90018c09ca6a7c30ce4251be93262de55c90757";
      };
    }
