
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_treedb-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/treedb/2016-08-25/treedb-20160825-git.tgz";
        sha256 = "81dd36b17532144a255d72bbaa75ce8ae5175d90d962e72bcb5c4ee8921a0a8e";
      };
    }
