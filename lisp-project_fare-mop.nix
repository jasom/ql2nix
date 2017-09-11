
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fare-mop-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fare-mop/2015-12-18/fare-mop-20151218-git.tgz";
        sha256 = "49d996251f8b18417f2581833b144164998991e06266ba74272178a636e6792f";
      };
    }
