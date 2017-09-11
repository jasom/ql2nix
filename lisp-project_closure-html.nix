
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_closure-html-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/closure-html/2014-08-26/closure-html-20140826-git.tgz";
        sha256 = "0ba35ec6ce5743f98880ff933ae667358dcd4b541cf2af9d2872fa92d38e07d4";
      };
    }
