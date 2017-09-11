
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_linewise-template-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/linewise-template/2016-02-08/linewise-template-20160208-git.tgz";
        sha256 = "cd8053b4286a0012e982be67adf31f82525373edd639e1b1c173bba22c0cb0ae";
      };
    }
