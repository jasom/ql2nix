
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cletris-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cletris/2015-10-31/cletris-20151031-git.tgz";
        sha256 = "418429589983647cc0ca926b3a42d6634b3ea53074a6e071359567f8d4a129d0";
      };
    }
