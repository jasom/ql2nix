
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-scram-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-scram/2015-09-23/cl-scram-20150923-git.tgz";
        sha256 = "f7145df6f98f63ca75aed0cc1ed96e0384a96af480fe5cde416e799d6df6cc08";
      };
    }
