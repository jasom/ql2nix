
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-marshal-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-marshal/2017-08-30/cl-marshal-20170830-git.tgz";
        sha256 = "5747db65dcccecb534fd22d60f95530960faff8d4dc055b3debabb1f7d8739fa";
      };
    }
