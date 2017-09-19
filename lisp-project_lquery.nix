
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lquery-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lquery/2017-08-30/lquery-20170830-git.tgz";
        sha256 = "a5e96d86da255618c39c164f4a0dc3ba7b0576b508fe5103c203bbfbf819c711";
      };
    }
