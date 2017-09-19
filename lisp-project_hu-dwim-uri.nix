
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-uri-20170630-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.uri/2017-06-30/hu.dwim.uri-20170630-darcs.tgz";
        sha256 = "fb6d868325714b98c4f242287b13b5b9a321b53f379b65c33c10607910720672";
      };
    }
