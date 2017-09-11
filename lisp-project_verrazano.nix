
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_verrazano-20120909-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/verrazano/2012-09-09/verrazano-20120909-darcs.tgz";
        sha256 = "13b9a7e6886a67007de3eda9ef6aa7199c1c1ec83fb8883e39748ff0075ac904";
      };
    }
