
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-data-format-validation-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-data-format-validation/2014-07-13/cl-data-format-validation-20140713-git.tgz";
        sha256 = "87a92b8441f5d2f1953256099abe8a15db69e88b80a5a9504a9059009d15c0c5";
      };
    }
