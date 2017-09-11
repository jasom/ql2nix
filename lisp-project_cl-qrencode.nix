
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-qrencode-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-qrencode/2017-01-24/cl-qrencode-20170124-git.tgz";
        sha256 = "19b85c12cf16f88f0be3c645b9d1c11fc009e9e307aff067bf6d8431ff4d6961";
      };
    }
