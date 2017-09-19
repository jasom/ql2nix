
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_random-state-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/random-state/2017-08-30/random-state-20170830-git.tgz";
        sha256 = "ae1c891e895aff43046117be6bbd6c4725a8b9871f9847a0e74e4d6c91444559";
      };
    }
