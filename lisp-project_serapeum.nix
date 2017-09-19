
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_serapeum-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/serapeum/2017-08-30/serapeum-20170830-git.tgz";
        sha256 = "1d465089890e7a428db9b25a75c4a161fda339398f9231982d778777d1fdba51";
      };
    }
