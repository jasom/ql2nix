
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_js-parser-20150407-git.lisp-in-asd.patch];
      name = "lisp-project_js-parser-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/js-parser/2015-04-07/js-parser-20150407-git.tgz";
        sha256 = "6e20652b89714001dd3f71298a611642940734be46fc2bc031fee070c399c5f8";
      };
    }
