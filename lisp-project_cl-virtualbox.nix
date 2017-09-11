
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-virtualbox-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-virtualbox/2015-01-13/cl-virtualbox-20150113-git.tgz";
        sha256 = "fd17974d23f314ede51602cd10ec318812b260771d81e95cb0414f89a27a0855";
      };
    }
