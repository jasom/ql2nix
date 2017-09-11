
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lift-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lift/2015-10-31/lift-20151031-git.tgz";
        sha256 = "86508fc31db3622c2f7229a398f22e88d18845b3be7d03585e799d33ea9d0ec1";
      };
    }
