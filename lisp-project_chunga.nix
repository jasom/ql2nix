
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chunga-1.1.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chunga/2014-12-17/chunga-1.1.6.tgz";
        sha256 = "efd3a4a1272cc8c04a0875967175abc65e99ff43a5ca0bad12f74f0953746dc7";
      };
    }
