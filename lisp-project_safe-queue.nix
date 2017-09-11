
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_safe-queue-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/safe-queue/2016-04-21/safe-queue-20160421-git.tgz";
        sha256 = "0489f936dfe660de001a835b91fd7f6b3b51a4457f969eec12c217ef884cde05";
      };
    }
