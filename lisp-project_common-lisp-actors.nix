
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_common-lisp-actors-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/common-lisp-actors/2015-12-18/common-lisp-actors-20151218-git.tgz";
        sha256 = "ebeb296c487c57b40cd05511ef23b5cdb31683125ee4679adb00c442affdf582";
      };
    }
