
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_universal-config-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/universal-config/2016-02-08/universal-config-20160208-git.tgz";
        sha256 = "d60b37ad9053b3c3700aa4f367a762eebf6f465a64875cefa780544aec9810f1";
      };
    }
