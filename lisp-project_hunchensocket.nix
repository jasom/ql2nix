
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hunchensocket-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hunchensocket/2016-10-31/hunchensocket-20161031-git.tgz";
        sha256 = "7b7ed5601562702254a429c88f407b781c68d83dba972c37f5b84c075dc3b821";
      };
    }
