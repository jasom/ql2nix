
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-debug-20170630-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.debug/2017-06-30/hu.dwim.debug-20170630-darcs.tgz";
        sha256 = "f075be248057f0b1036b0a63b541ef0f756395eb72ade0986c32c35387143360";
      };
    }
