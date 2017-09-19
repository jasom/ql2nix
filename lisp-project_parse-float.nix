
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parse-float-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parse-float/2017-08-30/parse-float-20170830-git.tgz";
        sha256 = "807227b4bb640e93aa2c2cfad98035f32d4540d82aac55a17b5bfce915e8a2e2";
      };
    }
