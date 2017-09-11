
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_postmodernity-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/postmodernity/2017-01-24/postmodernity-20170124-git.tgz";
        sha256 = "8581b4b6a2d84233ef44d1dc975a32d3e8baa8255b9dfce1c729b956ffea0471";
      };
    }
