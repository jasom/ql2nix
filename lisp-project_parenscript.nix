
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parenscript-2.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parenscript/2016-03-18/Parenscript-2.6.tgz";
        sha256 = "91963bc7a466671b023af6966be63e746342e898244ebb7057ff9def0e2079c3";
      };
    }
