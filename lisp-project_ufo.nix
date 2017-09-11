
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ufo-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ufo/2016-12-04/ufo-20161204-git.tgz";
        sha256 = "4c42ec6d7cf1322227abeed5607c6189793790405df73545deb00235c00303e2";
      };
    }
