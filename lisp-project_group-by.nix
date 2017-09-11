
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_group-by-20140211-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/group-by/2014-02-11/group-by-20140211-git.tgz";
        sha256 = "4f79234e45241fb4c7c8633c03d6eb1f980c8eca805cd00113e9499bf494ac76";
      };
    }
