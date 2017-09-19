
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lucerne-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lucerne/2016-02-08/lucerne-20160208-git.tgz";
        sha256 = "dcb3356b2378c34a18f5de96b6efbb817b44bc8f703856ccea2b510a535fda3a";
      };
    }
