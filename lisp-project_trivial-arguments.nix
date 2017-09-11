
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-arguments-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-arguments/2017-06-30/trivial-arguments-20170630-git.tgz";
        sha256 = "ba7602553b50ae513f5114d5d883d4c24a8edcec7f46642866bc84af98a86c90";
      };
    }
