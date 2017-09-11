
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_wu-sugar-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/wu-sugar/2016-08-25/wu-sugar-20160825-git.tgz";
        sha256 = "1e9dfbb91747c9a3b4e7a75a009f344f551e0c3645a2bed030e3ee1278ea341d";
      };
    }
