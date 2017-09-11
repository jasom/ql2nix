
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_declt-2.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/declt/2017-04-03/declt-2.1.tgz";
        sha256 = "f69f2cfab7e37dac19a859ab272227bae877728dd9e1c2cbc939f1b880a832ce";
      };
    }
