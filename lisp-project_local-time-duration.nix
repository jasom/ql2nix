
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_local-time-duration-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/local-time-duration/2017-02-27/local-time-duration-20170227-git.tgz";
        sha256 = "d277e84d1564ce119e473ab16260cdcdb0db2292e98eb938cab8720baa393eaa";
      };
    }
