
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fluent-logger-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fluent-logger/2017-08-30/cl-fluent-logger-20170830-git.tgz";
        sha256 = "c04d5bd7c7dd95844cfca9b28217503fa0cbd9bded317da64e6f3f3967b87188";
      };
    }
