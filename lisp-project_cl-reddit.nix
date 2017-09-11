
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-reddit-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-reddit/2016-10-31/cl-reddit-20161031-git.tgz";
        sha256 = "6bb3bd5051d8564664986bbec2cbdeb354d729c3307f19bb591927d2b78471bc";
      };
    }
