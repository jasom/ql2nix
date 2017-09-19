
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xhtmlgen-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xhtmlgen/2017-01-24/xhtmlgen-20170124-git.tgz";
        sha256 = "3607216fa2204f473c34bde15f8b5eacd860bf5591d8177e1b725437fec85d41";
      };
    }
