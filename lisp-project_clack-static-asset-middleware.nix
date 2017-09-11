
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clack-static-asset-middleware-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clack-static-asset-middleware/2016-06-28/clack-static-asset-middleware-20160628-git.tgz";
        sha256 = "229fcb6c5d5087f82b2eb1001a8960f4d309c968ef488c3f31f0b3739c12834e";
      };
    }
