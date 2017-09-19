
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_closer-mop-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/closer-mop/2017-08-30/closer-mop-20170830-git.tgz";
        sha256 = "f3b00cdb1a46ad3685c7b7a5ae994767400c0d95ed1295f344af9a71fe15616e";
      };
    }
