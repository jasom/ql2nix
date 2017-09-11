
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_disposable-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/disposable/2016-02-08/disposable-20160208-git.tgz";
        sha256 = "281e6d2219b8583d458e9732853743a5107d393db00d38b07241465dae985f2c";
      };
    }
