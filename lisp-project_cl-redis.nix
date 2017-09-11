
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-redis-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-redis/2016-08-25/cl-redis-20160825-git.tgz";
        sha256 = "10e10421b4d415aeb3d0b93d8faff1f335ddcd8e0f5ec4b4621ae5e94be669c8";
      };
    }
