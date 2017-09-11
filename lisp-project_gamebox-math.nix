
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-math-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-math/2017-07-25/gamebox-math-20170725-git.tgz";
        sha256 = "6fffc8a65070d011d5a03aceaa8c6e96319b0f5258ef604f79141100c7f19e00";
      };
    }
