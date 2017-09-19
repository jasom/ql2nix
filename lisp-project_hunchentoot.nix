
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hunchentoot-v1.2.37";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hunchentoot/2017-08-30/hunchentoot-v1.2.37.tgz";
        sha256 = "8ca67709c1c85760e3487946f1593af285b5cad75ea242914afe8ba6154617e4";
      };
    }
