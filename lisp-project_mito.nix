
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mito-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mito/2017-08-30/mito-20170830-git.tgz";
        sha256 = "e3516e902c9a7bab0af7071e23926f57f40a5c84f52064ff7e326e50b6a7e572";
      };
    }
