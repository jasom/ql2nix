
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-arguments-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-arguments/2017-08-30/trivial-arguments-20170830-git.tgz";
        sha256 = "5d52ab906a654dd9a39ed02885d8366774ebc1218fcf9b6cdd87bed5ed297dbd";
      };
    }
