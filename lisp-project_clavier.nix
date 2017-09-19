
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clavier-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clavier/2017-08-30/clavier-20170830-git.tgz";
        sha256 = "ecf52598620d23a483745c8b82c9efff2a44f2579cf2bc31b96940f45a1078fd";
      };
    }
