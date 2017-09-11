
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lassie-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lassie/2014-07-13/lassie-20140713-git.tgz";
        sha256 = "ab82324d024239115de8f96b1387118d6d31399b4e249ca11a6d675149b1a468";
      };
    }
