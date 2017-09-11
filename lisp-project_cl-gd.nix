
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gd-0.6.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gd/2014-12-17/cl-gd-0.6.1.tgz";
        sha256 = "ffc1f09f6683ab7358fd5c842df4fa1e443f9e4acab869146d2aba3e9bd61797";
      };
    }
