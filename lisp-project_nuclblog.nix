
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_nuclblog-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/nuclblog/2014-08-26/nuclblog-20140826-git.tgz";
        sha256 = "e6900a801e8298ce418201809dd33f271dc5ad60ffe861ca856a535bdb480166";
      };
    }
