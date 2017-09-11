
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bytecurry-mocks-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bytecurry.mocks/2015-05-05/bytecurry.mocks-20150505-git.tgz";
        sha256 = "c8787c53069292db3eaa7af1378a87fa949e65ae9582504b2e69f01809cd51d7";
      };
    }
