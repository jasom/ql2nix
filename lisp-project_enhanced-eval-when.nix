
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_enhanced-eval-when-1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/enhanced-eval-when/2012-11-25/enhanced-eval-when-1.0.tgz";
        sha256 = "99b7c7015338469de4420ebf12a732161a6c83703941e3735d2776ba8064f328";
      };
    }
