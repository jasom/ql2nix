
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-langutils-20121125-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-langutils/2012-11-25/cl-langutils-20121125-git.tgz";
        sha256 = "fc11711cd1439f4aa79ac032504462504e415b5ded31bd76b55e85066a7c7667";
      };
    }
