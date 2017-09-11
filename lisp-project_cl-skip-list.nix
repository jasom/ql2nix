
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-skip-list-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-skip-list/2013-06-15/cl-skip-list-20130615-git.tgz";
        sha256 = "3cd858c1e9f218fb0592a496ae4ead98bd758b9b1ed820929d9f262f732e25a8";
      };
    }
