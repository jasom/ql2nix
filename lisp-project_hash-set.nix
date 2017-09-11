
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hash-set-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hash-set/2016-06-28/hash-set-20160628-git.tgz";
        sha256 = "435311fbd3eb0bd45332587164d881db1c92ca9aa76577a129ae89da6c18810f";
      };
    }
