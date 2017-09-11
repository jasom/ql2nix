
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-documentation-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-documentation/2016-12-04/trivial-documentation-20161204-git.tgz";
        sha256 = "44449753c8a1a27f6cf8ff855de152524baf16e2a47df834b964179a6b5d29be";
      };
    }
