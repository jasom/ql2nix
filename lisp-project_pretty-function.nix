
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pretty-function-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pretty-function/2013-06-15/pretty-function-20130615-git.tgz";
        sha256 = "62f8e906e4962ce675e2562f8f9d5d8d6274e0297f131a820bc489f71ecd5422";
      };
    }
