
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_woo-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/woo/2017-08-30/woo-20170830-git.tgz";
        sha256 = "1b323ba9843754c48ab771b00cc90cb1698882bb7429371db0903d04ae7b108c";
      };
    }
