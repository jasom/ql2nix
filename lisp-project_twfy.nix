
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_twfy-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/twfy/2013-04-20/twfy-20130420-git.tgz";
        sha256 = "572bfb8b02313e6c14e3f61142c658ab8e9ef6859e086799d62e7f5e6d082505";
      };
    }
