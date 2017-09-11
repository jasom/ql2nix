
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-enumeration-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-enumeration/2017-06-30/cl-enumeration-20170630-git.tgz";
        sha256 = "88d071014cf3f3659bda6d659ab2b3e1e3a16cf3533ff3d4a8ccb793b5649a41";
      };
    }
