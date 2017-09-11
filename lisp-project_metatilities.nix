
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_metatilities-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/metatilities/2017-06-30/metatilities-20170630-git.tgz";
        sha256 = "9f69e9574e2ce5ca8ece9fdc43515156004ebffcade3d079664a3069428d2c15";
      };
    }
