
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hermetic-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hermetic/2017-04-03/hermetic-20170403-git.tgz";
        sha256 = "f28979c5b23518c2b2314478806bd663a220d2effc2e0dc34899596b78bba086";
      };
    }
