
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_qlot-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/qlot/2017-07-25/qlot-20170725-git.tgz";
        sha256 = "13c0fd4280cd255b73e973ee8e43e79de11859417cc7f61156a424f8acbbbb2e";
      };
    }
