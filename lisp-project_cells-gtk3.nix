
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cells-gtk3-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cells-gtk3/2016-08-25/cells-gtk3-20160825-git.tgz";
        sha256 = "9db44d1e745d69eef5d060961c9c213a2e2a6785e89da4e93d6a18086994df36";
      };
    }
