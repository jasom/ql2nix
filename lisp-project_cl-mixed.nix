
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mixed-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mixed/2017-08-30/cl-mixed-20170830-git.tgz";
        sha256 = "6459555c86b583326d582a0e6c4faf0b241c28fe06cd6c5362c1e95b45207316";
      };
    }
