
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_crypto-shortcuts-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/crypto-shortcuts/2017-06-30/crypto-shortcuts-20170630-git.tgz";
        sha256 = "55b1d25766d928ebb3b2a45d005bce051cf5214807334e06f235b95e9165a2dc";
      };
    }
