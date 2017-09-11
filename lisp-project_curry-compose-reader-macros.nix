
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_curry-compose-reader-macros-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/curry-compose-reader-macros/2017-06-30/curry-compose-reader-macros-20170630-git.tgz";
        sha256 = "905cc847b03f8f05a010f1f40ebb2b546830beaac2204e9eb04fe37414949700";
      };
    }
