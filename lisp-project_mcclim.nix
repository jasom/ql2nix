
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mcclim-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mcclim/2017-08-30/mcclim-20170830-git.tgz";
        sha256 = "d440f6c9cc6db391c52d03ab53a867abeb3acc1a1c20443e4799a8e80a847fee";
      };
    }
