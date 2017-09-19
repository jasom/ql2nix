
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_poiu-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/poiu/2017-08-30/poiu-20170830-git.tgz";
        sha256 = "85c02e5d67106c40a239f5b075f3f0e9d3cbd01ccc477b35db1ac46444f140e0";
      };
    }
