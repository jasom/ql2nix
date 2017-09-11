
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cookie-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cookie/2015-08-04/cl-cookie-20150804-git.tgz";
        sha256 = "c8afb557699f62fb016eec2a3779736d0957ff0acf4e767f5525f273452b9052";
      };
    }
