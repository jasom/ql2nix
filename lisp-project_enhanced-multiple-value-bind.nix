
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_enhanced-multiple-value-bind-1.0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/enhanced-multiple-value-bind/2012-11-25/enhanced-multiple-value-bind-1.0.1.tgz";
        sha256 = "f344f60c800a07c7e8a445ce619ffe99eba0566a8d829d4246a1cb2707238bba";
      };
    }
