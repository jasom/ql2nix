
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_external-program-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/external-program/2016-08-25/external-program-20160825-git.tgz";
        sha256 = "23e0c92af95c156711498c791a99e0e1faaf6d1a23d41153cc8e07d53bb4762b";
      };
    }
