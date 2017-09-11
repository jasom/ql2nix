
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_blackbird-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/blackbird/2016-05-31/blackbird-20160531-git.tgz";
        sha256 = "09ff779cba612177972a5472f2a21a2c47b5aa35da3fe79bc1e13757961b0550";
      };
    }
