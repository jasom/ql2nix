
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-shell-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-shell/2017-06-30/trivial-shell-20170630-git.tgz";
        sha256 = "cd6b7d5d9f9537865501fd6bfcf8304570b5ad224e0ec4155ea7a3832427f3cd";
      };
    }
