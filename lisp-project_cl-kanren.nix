
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-kanren-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-kanren/2017-08-30/cl-kanren-20170830-git.tgz";
        sha256 = "de78ab999bfbf0f99c1752559451c34544aeb2aec80a63af36bee332d06fb997";
      };
    }
