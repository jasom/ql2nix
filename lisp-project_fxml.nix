
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fxml-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fxml/2017-08-30/fxml-20170830-git.tgz";
        sha256 = "7bf2d66f5a043314bd40a12c81c1598ea5de273ab4e4276c99e2c95098138d8c";
      };
    }
