
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lichat-serverlib-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lichat-serverlib/2017-08-30/lichat-serverlib-20170830-git.tgz";
        sha256 = "178e09eda30056de4f13a888d1328d081589696a45ca7ca0c05a30e06ef73843";
      };
    }
