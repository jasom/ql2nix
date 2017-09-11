
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_contextl-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/contextl/2016-03-18/contextl-20160318-git.tgz";
        sha256 = "20086df22f4fe4aaac82ff4f8181bd1fc55a5f5dda583cefa3822e79b484b44d";
      };
    }
