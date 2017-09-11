
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-crypt-20120520-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-crypt/2012-05-20/cl-crypt-20120520-git.tgz";
        sha256 = "b3d797ef8742d65054c06e74387c25225360d2806a05df49763d2e002105d953";
      };
    }
