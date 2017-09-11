
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clx-cursor-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clx-cursor/2012-09-09/clx-cursor-20120909-git.tgz";
        sha256 = "d98d92ceff8d417d77a2a970f777f78640e4bbcb10b2e4c0b768062f691c0762";
      };
    }
