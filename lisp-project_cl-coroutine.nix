
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-coroutine-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-coroutine/2016-09-29/cl-coroutine-20160929-git.tgz";
        sha256 = "7c47c3ba1bb08eea003a9ceef804d4d296580f7894ac8b9cbf3d717c92f6644d";
      };
    }
