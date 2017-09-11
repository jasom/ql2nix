
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-clon0b24";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-clon/2015-07-09/clon-1.0b24.tgz";
        sha256 = "5943b89950ccf45aec2d08af514ee4e5ef6119bf6aa8bf72056894924af35d36";
      };
    }
