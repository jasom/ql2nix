
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zs3-1.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zs3/2016-10-31/zs3-1.3.tgz";
        sha256 = "161ad831d0b4451226bf55a2ff165e442f4f507f44e0ff645db5dc7fa3870df1";
      };
    }
