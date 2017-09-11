
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zenekindarl-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zenekindarl/2017-04-03/zenekindarl-20170403-git.tgz";
        sha256 = "4e1dcd5ca673e09b8c3a005d97441ec8b694930c922a27f869b8e17908aa2005";
      };
    }
