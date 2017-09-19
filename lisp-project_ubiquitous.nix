
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ubiquitous-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ubiquitous/2017-08-30/ubiquitous-20170830-git.tgz";
        sha256 = "0d2fa911fc390e3f637aee8df54af1021432907fe5cd6bea55dfee7cbdaf0488";
      };
    }
