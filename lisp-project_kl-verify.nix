
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_kl-verify-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/kl-verify/2012-09-09/kl-verify-20120909-git.tgz";
        sha256 = "3cdced960680117e995c146583a4dbb2f4f8e29ed6725c5a5da57791e0909125";
      };
    }
