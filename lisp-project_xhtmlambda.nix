
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xhtmlambda-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xhtmlambda/2017-06-30/xhtmlambda-20170630-git.tgz";
        sha256 = "48df7b0969ea1e63be679ee07695c4bf72ed68eacdb99cd2c3c48dc440a6fb39";
      };
    }
