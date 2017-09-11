
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-prose-diff-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-prose-diff/2014-07-13/monkeylib-prose-diff-20140713-git.tgz";
        sha256 = "a05cad859a2f49100363e9b74c717bfaf9621d8dbdde56a88b841771ba14699c";
      };
    }
