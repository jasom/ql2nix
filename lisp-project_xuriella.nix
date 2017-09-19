
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xuriella-20120305-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xuriella/2012-03-05/xuriella-20120305-git.tgz";
        sha256 = "7f68c68e2110a000caa624d48a81647b42aac9779b41350d45ecaadea8e89ba7";
      };
    }
