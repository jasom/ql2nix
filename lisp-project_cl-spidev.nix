
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-spidev-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-spidev/2017-08-30/cl-spidev-20170830-git.tgz";
        sha256 = "58af9a0584b57427edc58bf2022b78a647b8e137ded3f0696017ecfc1dd40ac3";
      };
    }
