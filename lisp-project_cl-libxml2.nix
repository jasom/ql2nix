
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-libxml2-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-libxml2/2013-06-15/cl-libxml2-20130615-git.tgz";
        sha256 = "79acc7a8a884645cfa45603c49796d47a9859b4e7d201ff3923f8425d2c86c3c";
      };
    }
