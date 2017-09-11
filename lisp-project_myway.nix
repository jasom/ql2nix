
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_myway-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/myway/2015-03-02/myway-20150302-git.tgz";
        sha256 = "902e1f95a301c2fb98ed9d2572b9381cdea320b32533db4b1e4f72f87f5aeaea";
      };
    }
