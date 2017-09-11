
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_binfix-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/binfix/2017-02-27/binfix-20170227-git.tgz";
        sha256 = "2e84e08a757a1aae6a98fb5ec91f6d281d13ee6c452af2cb5e1986e9d99bcdb8";
      };
    }
