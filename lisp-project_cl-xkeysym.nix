
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-xkeysym-20140914-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-xkeysym/2014-09-14/cl-xkeysym-20140914-git.tgz";
        sha256 = "e65afdfc0554ee266ba39fba390b5293368fcf7fc8ead7a08097ff7b1dcc8d6d";
      };
    }
