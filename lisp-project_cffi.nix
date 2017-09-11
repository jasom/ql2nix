
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cffi_0.19.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cffi/2017-06-30/cffi_0.19.0.tgz";
        sha256 = "49366f97ce20f1a9081b1abce89ab62608dc781dfeb40105a6c98d8b8182638b";
      };
    }
