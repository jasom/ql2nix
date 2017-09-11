
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_symbol-munger-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/symbol-munger/2015-04-07/symbol-munger-20150407-git.tgz";
        sha256 = "66634f8371819d568ccfab58dccf35c96d55b321063e9b85f77b9e5250a48c35";
      };
    }
