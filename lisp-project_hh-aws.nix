
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hh-aws-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hh-aws/2015-08-04/hh-aws-20150804-git.tgz";
        sha256 = "8a95d66105ac09af8589b31ed4bd1b97fdb1a41390071b9a1fe42776c070854a";
      };
    }
