
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-def-20170630-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.def/2017-06-30/hu.dwim.def-20170630-darcs.tgz";
        sha256 = "4eb2d0ad0fe8135988997d8f6fdf503f8a8c6550f77f68a74754f34e89e4983a";
      };
    }
