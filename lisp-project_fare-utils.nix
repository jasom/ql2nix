
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fare-utils-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fare-utils/2017-01-24/fare-utils-20170124-git.tgz";
        sha256 = "f8aa966455e37f62d58acd95d091650a974a4401ed712fdfbc7a58c650000b4a";
      };
    }
