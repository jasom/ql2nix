
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clsql-orm-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clsql-orm/2016-02-08/clsql-orm-20160208-git.tgz";
        sha256 = "4a1ffd2d369d51eb46ccaa7d74092c5cffff29600f727985ce5b9e8e26f14ffe";
      };
    }
