
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jp-numeral-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jp-numeral/2016-04-21/jp-numeral-20160421-git.tgz";
        sha256 = "69e18b4d5d33bfec9da3742ffb0d5e853da8d87ea8a021ceba301fb86e0b3cb7";
      };
    }
