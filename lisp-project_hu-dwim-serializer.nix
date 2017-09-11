
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-serializer-20161204-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.serializer/2016-12-04/hu.dwim.serializer-20161204-darcs.tgz";
        sha256 = "cb4882230dac73e1645af0ddce92e92057142adee8276f40b9f1e05050153b85";
      };
    }
