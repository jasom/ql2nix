
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_iterate-20160825-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/iterate/2016-08-25/iterate-20160825-darcs.tgz";
        sha256 = "f55db27495b731c65f3d3dee8b453cd55924b22f1ef5e01df86dda6e9f097f4f";
      };
    }
