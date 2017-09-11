
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_psychiq-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/psychiq/2017-01-24/psychiq-20170124-git.tgz";
        sha256 = "2a15ca09108e2b02ad3a4d70628cda09bd9c282109d5a4d969334af0fd05b49a";
      };
    }
