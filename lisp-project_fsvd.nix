
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fsvd-20131211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fsvd/2013-12-11/fsvd-20131211-git.tgz";
        sha256 = "bc990674eaf65f37df0b787fcf8c1f6b765c907d2c0250539f3dc8e0ad2019d2";
      };
    }
