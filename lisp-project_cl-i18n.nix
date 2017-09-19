
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-i18n-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-i18n/2016-06-28/cl-i18n-20160628-git.tgz";
        sha256 = "cd7fa6c5d7f7272ac251088c85562c94e16e2831016840a6a5777b765f67b985";
      };
    }
