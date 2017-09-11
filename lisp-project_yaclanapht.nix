
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_yaclanapht-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/yaclanapht/2013-06-15/yaclanapht-20130615-git.tgz";
        sha256 = "9a85e6967eafb576df06a711cf499962b436a9ac6df8e31616c7489cd0c21792";
      };
    }
