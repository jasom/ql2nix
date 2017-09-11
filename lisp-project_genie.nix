
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_genie-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/genie/2017-07-25/genie-20170725-git.tgz";
        sha256 = "36ba2afe0882926baff6286ed8b2bc146ab8380db643aa9af5a6f9e6a6fd143b";
      };
    }
