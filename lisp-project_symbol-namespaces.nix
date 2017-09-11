
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_symbol-namespaces-1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/symbol-namespaces/2013-01-28/symbol-namespaces-1.0.tgz";
        sha256 = "0d070ebf2e5da084f6e12acedb5b981d969458b92055c310237b035f6bb5f6da";
      };
    }
