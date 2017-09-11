
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_random-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/random/2015-06-08/random-20150608-git.tgz";
        sha256 = "8b234885d7cdd32bec00191c75ea2f97dbbe105ef1bcd906e59b0952a849d88a";
      };
    }
