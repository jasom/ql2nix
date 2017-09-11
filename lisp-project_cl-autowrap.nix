
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-autowrap-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-autowrap/2017-07-25/cl-autowrap-20170725-git.tgz";
        sha256 = "fd570d8f10a77b162f9ca4494ea9fd1fa6dd4f5ee1ef02f10a7a5d32c3fe5205";
      };
    }
