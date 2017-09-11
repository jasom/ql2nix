
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_madeira-port-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/madeira-port/2015-07-09/madeira-port-20150709-git.tgz";
        sha256 = "379b712a5081084b999949c4be532e99b9535b991ca8be3d0ae3f7c5dec329b9";
      };
    }
