
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cqlcl-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cqlcl/2014-11-06/cqlcl-20141106-git.tgz";
        sha256 = "15624e72197fcc075faca3733351900e3b25ba300ceb7cda5e5a56aae652474b";
      };
    }
