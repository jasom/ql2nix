
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-vhdl-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-vhdl/2016-04-21/cl-vhdl-20160421-git.tgz";
        sha256 = "d51874001ba63c653f5c8966e64c12e9d197ecbdcd09d6a0f930cae1b5032fcc";
      };
    }
