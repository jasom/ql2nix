
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ssdb-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ssdb/2017-07-25/cl-ssdb-20170725-git.tgz";
        sha256 = "9c07987ee5fe501a6145017e6429206bb23ededf031360a3155d3be61c959b9b";
      };
    }
