
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_qlot-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/qlot/2017-08-30/qlot-20170830-git.tgz";
        sha256 = "7842e6e0db176dba158242cb70d6500889083e9d3d77d0249b4e349bc1ac05c0";
      };
    }
