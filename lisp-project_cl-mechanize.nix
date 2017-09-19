
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mechanize-20110219-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mechanize/2011-02-19/cl-mechanize-20110219-git.tgz";
        sha256 = "9dabda1b5a8eeff7a10adbf3f3cddf154c6f29d75e27caf7b4516dbc8805f557";
      };
    }
