
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-executable-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-executable/2016-03-18/lisp-executable-20160318-git.tgz";
        sha256 = "517a532ab6b34422952d8c4504423251eeb421e9a7ed4eaa01114a3e818ff5dc";
      };
    }
