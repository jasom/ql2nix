
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-system-connections-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-system-connections/2017-01-24/asdf-system-connections-20170124-git.tgz";
        sha256 = "f8723e0b0b8bd5f964f7726536e52aacb2e9833d475fcde8333cda81d7190241";
      };
    }
