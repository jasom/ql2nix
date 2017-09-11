
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ayah-captcha-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ayah-captcha/2017-06-30/ayah-captcha-20170630-git.tgz";
        sha256 = "69936d0fa68821a37b70408c2ce59cdb15101fa204dcdf7e32becb06c74a6b6b";
      };
    }
