
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-http-client-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-http-client/2015-10-31/s-http-client-20151031-git.tgz";
        sha256 = "a52c652ff3dc340b2c7a29edefa5d313f4b029c088295e3d9ca5b81c52f09856";
      };
    }
