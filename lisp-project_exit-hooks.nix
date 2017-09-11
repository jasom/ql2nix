
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_exit-hooks-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/exit-hooks/2017-04-03/exit-hooks-20170403-git.tgz";
        sha256 = "c0fed13632b3503837df046a569960c566909a3e89017adb5083c5adb346fb04";
      };
    }
