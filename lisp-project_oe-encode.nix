
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_oe-encode-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/oe-encode/2015-08-04/oe-encode-20150804-git.tgz";
        sha256 = "1665d186c1e9ab7a413fed733b3bb22db0b0844e6d1f7bfef5839e85e2b25cb1";
      };
    }
