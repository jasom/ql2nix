
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-glop-release-quicklisp-93c9eb77-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.glop/2017-06-30/cepl.glop-release-quicklisp-93c9eb77-git.tgz";
        sha256 = "a5e77943ac8d50910e4af61bbefa0c019d690d2fd30565fe39295fe2be19488a";
      };
    }
