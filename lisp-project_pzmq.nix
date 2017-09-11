
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pzmq-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pzmq/2017-04-03/pzmq-20170403-git.tgz";
        sha256 = "88140c8ce83174cc8bf2f8b39e04eb3e66bbdf681f945651de15c35e79a306f7";
      };
    }
