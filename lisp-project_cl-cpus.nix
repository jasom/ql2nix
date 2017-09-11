
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cpus-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cpus/2017-06-30/cl-cpus-20170630-git.tgz";
        sha256 = "9d63e746ca75b2b6be7ea717e0730cb994a2b529e0046eb167dc9f719d78160e";
      };
    }
