
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gpio-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gpio/2017-06-30/cl-gpio-20170630-git.tgz";
        sha256 = "07b45ea53d83b8dbc6ea212a49ef38b02eed6b1f39eb6453fe65927b5ad96673";
      };
    }
