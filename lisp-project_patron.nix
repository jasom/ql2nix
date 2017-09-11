
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_patron-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/patron/2013-04-20/patron-20130420-git.tgz";
        sha256 = "94c5ea3075f36785a346a5b9c20777dff3d821a2e545ca110990bfaa8307856f";
      };
    }
