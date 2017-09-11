
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bencode-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bencode/2017-06-30/cl-bencode-20170630-git.tgz";
        sha256 = "7fed256d30ef5476ae409a5bccc82d462feb546aacaf3bfa8ef7ff472f0146f0";
      };
    }
