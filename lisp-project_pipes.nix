
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pipes-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pipes/2015-09-23/pipes-20150923-git.tgz";
        sha256 = "237c634db74f25994804cc994ba9be85411733a064f7c1dcbc30a380394bb6d4";
      };
    }
