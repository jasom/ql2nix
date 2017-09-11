
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_softdrink-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/softdrink/2017-06-30/softdrink-20170630-git.tgz";
        sha256 = "580cc58339b7dee36cd957093554e859d4faa18cf37453879cb6d32cda4c6060";
      };
    }
