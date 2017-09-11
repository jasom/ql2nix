
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_smug-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/smug/2016-04-21/smug-20160421-git.tgz";
        sha256 = "0282979d4bc27ee2616a8930fefe92b96602c4113b74ad265c3a5406b2793139";
      };
    }
