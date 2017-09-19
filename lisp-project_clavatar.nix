
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clavatar-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clavatar/2012-10-13/clavatar-20121013-git.tgz";
        sha256 = "ce73e27dc4853423134f14f3a0fcf344e7fd2e5bf905daa9c203689dc6f9f30f";
      };
    }
