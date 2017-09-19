
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flac-parser-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flac-parser/2017-08-30/flac-parser-20170830-git.tgz";
        sha256 = "961f9328510beb4826e13893914b99f188f0e38e9d50ad02cc443130cd38b313";
      };
    }
