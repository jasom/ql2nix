
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clobber-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clobber/2017-01-24/clobber-20170124-git.tgz";
        sha256 = "24a48166e190893fc5fb5cc7d2a88953f8618a06f3fccf211791acb89447575e";
      };
    }
