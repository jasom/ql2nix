
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-who-1.1.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-who/2014-12-17/cl-who-1.1.4.tgz";
        sha256 = "3813c289727515c236906e290aa9374178795a6d703df8ec612c7c6945623c65";
      };
    }
