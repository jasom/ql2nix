
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3b-swf-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3b-swf/2012-01-07/3b-swf-20120107-git.tgz";
        sha256 = "0102a9ac1561a2120903288b8c9a64b3214ade4a5075b6cb8f67b8dfb44e20ed";
      };
    }
