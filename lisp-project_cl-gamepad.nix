
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gamepad-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gamepad/2017-08-30/cl-gamepad-20170830-git.tgz";
        sha256 = "3d0affba3033bef81792ad519ce5eb7dc57638d46d3ad7caea27f114962089c9";
      };
    }
