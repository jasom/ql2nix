
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mtlisp-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mtlisp/2013-06-15/mtlisp-20130615-git.tgz";
        sha256 = "30c9aae0320c262c2154f4dcbe41324c847e49de18d7fd9e22ad9b8023f62282";
      };
    }
