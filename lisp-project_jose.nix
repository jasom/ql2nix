
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jose-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jose/2017-08-30/jose-20170830-git.tgz";
        sha256 = "2ac7439188f81891dc05078bb6e310d9ce2f1c9813a59763eb6ee474af8eba38";
      };
    }
