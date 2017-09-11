
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-html-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-html/2017-06-30/monkeylib-html-20170630-git.tgz";
        sha256 = "5f1ec55f2f87d81578ea036c174231efb73ef8bb183dfbdef978a8db071b937d";
      };
    }
