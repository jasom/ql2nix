
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-channels-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-channels/2016-04-21/trivial-channels-20160421-git.tgz";
        sha256 = "80f315591a12ac5ba4859773e36e07e95aa1bb320e6f192a11290b473b7b795f";
      };
    }
