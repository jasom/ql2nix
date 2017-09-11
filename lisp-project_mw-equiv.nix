
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mw-equiv-0.1.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mw-equiv/2010-10-06/mw-equiv-0.1.3.tgz";
        sha256 = "f9fba737be25b3f4403ef7cba8faa75e8bef7215b309a50b3095192d6ea4bb4d";
      };
    }
