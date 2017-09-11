
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cerberus-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cerberus/2015-07-09/cerberus-20150709-git.tgz";
        sha256 = "fe5a9321ca9bf60d5e184e0110d13a81bc2b904b4a3c68467c053298c231e6f8";
      };
    }
