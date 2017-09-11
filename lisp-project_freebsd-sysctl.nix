
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_freebsd-sysctl-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/freebsd-sysctl/2017-02-27/freebsd-sysctl-20170227-git.tgz";
        sha256 = "0d9e75dc4d355e2d7293b6e1e94cf623e63d01a519559a9fd80256b3133a7e69";
      };
    }
