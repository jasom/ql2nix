
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-opengl-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-opengl/2017-08-30/cl-opengl-20170830-git.tgz";
        sha256 = "d44098c566afb7fa2f1a14a9db1fd320bf7e556b06e7b70b15773e76170bf05e";
      };
    }
