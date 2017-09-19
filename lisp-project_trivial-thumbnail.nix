
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-thumbnail-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-thumbnail/2017-08-30/trivial-thumbnail-20170830-git.tgz";
        sha256 = "fbf741d1e6b69894d3ecc1c398556c50a90e571afdc52a30d4448be36b602657";
      };
    }
