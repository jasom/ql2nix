
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_esrap-peg-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/esrap-peg/2017-04-03/esrap-peg-20170403-git.tgz";
        sha256 = "8972c4fc1b5faf1c317539b1dc6b5984eed862b14ba5a0ffa514b9836ea07788";
      };
    }
