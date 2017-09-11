
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-bundle-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump-bundle/2017-06-30/plump-bundle-20170630-git.tgz";
        sha256 = "207548061a09c2b3830ebabc48704d2d22666a786a57a0dd729ec73e39ae6f74";
      };
    }
