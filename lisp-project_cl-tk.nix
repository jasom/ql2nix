
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tk-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tk/2015-06-08/cl-tk-20150608-git.tgz";
        sha256 = "2bc83607757248c50fa2c4482ef9498463a846fae9aebc937eeaa4e9299ced6f";
      };
    }
