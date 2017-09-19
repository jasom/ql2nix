
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_coleslaw-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/coleslaw/2017-08-30/coleslaw-20170830-git.tgz";
        sha256 = "ed3e1ddaf80032a3ff0740e6d9a0811982065646bc440938fb84fb08c904a059";
      };
    }
