
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_city-hash-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/city-hash/2016-08-25/city-hash-20160825-git.tgz";
        sha256 = "0927c85b69d1bcb8216193b0b99899cdea70dfc373fa457fe0ca53091cae24e9";
      };
    }
