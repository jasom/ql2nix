
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flow-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flow/2017-08-30/flow-20170830-git.tgz";
        sha256 = "3e6d6a918feb644c67f4708321de50f4e29485f64bbbb40da14f8a27728743fb";
      };
    }
