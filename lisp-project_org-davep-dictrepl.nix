
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_org-davep-dictrepl-20120407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/org-davep-dictrepl/2012-04-07/org-davep-dictrepl-20120407-git.tgz";
        sha256 = "1bdbdfb4b704f4f0fa4de37d58653b8ca29fc12f115a2db326eaf951f35590dd";
      };
    }
