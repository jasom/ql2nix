
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deferred-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deferred/2017-08-30/deferred-20170830-git.tgz";
        sha256 = "dfcdc841d38fba38a83ae7369bc7fbf90a0a221a15a78d09bc5c0c2754119155";
      };
    }
