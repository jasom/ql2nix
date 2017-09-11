
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_codata-recommended-values-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/codata-recommended-values/2015-10-31/codata-recommended-values-20151031-git.tgz";
        sha256 = "a23f00d4b316ba6b57295f445ef2a34ab3291bd08a0d6aa088549ba072a2c139";
      };
    }
