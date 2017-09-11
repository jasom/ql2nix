
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-qprint-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-qprint/2015-08-04/cl-qprint-20150804-git.tgz";
        sha256 = "48604a8a0faed160c64cf1698e86757ccdfa752c9ed6fbb1f284cd1c55c25610";
      };
    }
