
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fxml-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fxml/2017-06-30/fxml-20170630-git.tgz";
        sha256 = "a19c40c48c397ef32654ee16f475868669d5eae75bcf37d34115800f2c45b9ae";
      };
    }
