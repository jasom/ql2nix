
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rate-monotonic-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rate-monotonic/2017-01-24/rate-monotonic-20170124-git.tgz";
        sha256 = "2939fe6349add1e2db1b6fbf3149ff389335bad2a51f39d8d817217a2edd4d27";
      };
    }
