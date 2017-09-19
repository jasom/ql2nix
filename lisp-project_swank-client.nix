
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_swank-client-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/swank-client/2015-06-08/swank-client-20150608-git.tgz";
        sha256 = "24cc9478523ff7a973aac6d1e40324339b0878200fb99822ec30a2b8456491ee";
      };
    }
