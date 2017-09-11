
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_checkl-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/checkl/2015-01-13/checkl-20150113-git.tgz";
        sha256 = "53d3e2b36b76352f207b74fc221cdcc7478fe07cb004253084d164e7fc974752";
      };
    }
