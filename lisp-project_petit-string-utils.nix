
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_petit-string-utils-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/petit.string-utils/2014-11-06/petit.string-utils-20141106-git.tgz";
        sha256 = "e7ae4dfa4a98045029bf887b2199c5d3529e07745bf02789414885cf78af6cf9";
      };
    }
