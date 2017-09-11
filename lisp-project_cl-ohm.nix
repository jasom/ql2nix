
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ohm-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ohm/2017-06-30/cl-ohm-20170630-git.tgz";
        sha256 = "5ba2f5a30e76e9626fb7ffe079ccba002b683d74b6ff083a6f94cf31401d1614";
      };
    }
