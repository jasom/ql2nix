
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_wookie-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/wookie/2017-02-27/wookie-20170227-git.tgz";
        sha256 = "609b5a776040c25451a9e1eede67de7dbca039d7ee87dde841e3e557f2cb3c44";
      };
    }
