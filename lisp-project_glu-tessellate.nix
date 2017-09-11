
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glu-tessellate-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glu-tessellate/2015-06-08/glu-tessellate-20150608-git.tgz";
        sha256 = "86450e8086c3c65614308bd13b4342b401d769af6a28ff4c4830d17e73ff7192";
      };
    }
