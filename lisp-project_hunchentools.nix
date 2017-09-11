
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hunchentools-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hunchentools/2016-12-04/hunchentools-20161204-git.tgz";
        sha256 = "53020949ef754136449e61ddc39ff4cc52ee1b8419660d5f2a19f576312d618c";
      };
    }
