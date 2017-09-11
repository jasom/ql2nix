
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-freetype2-20170124-git.ftinclude.patch];
      name = "lisp-project_cl-freetype2-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-freetype2/2017-01-24/cl-freetype2-20170124-git.tgz";
        sha256 = "aab8bb94bbb919f30ce49dc705982d524146a17c23f7a28689a132debfcec4e0";
      };
    }
