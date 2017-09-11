
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_toot-20121125-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/toot/2012-11-25/toot-20121125-git.tgz";
        sha256 = "8ebcbfbdbef042b7e78fe09af0fc68df87d55f0e844cbc45c40e9f2ec7ac90a7";
      };
    }
