
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_prepl-20101207-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/prepl/2010-12-07/prepl-20101207-git.tgz";
        sha256 = "4ae25e48f79a291e02f7ccab9940e0251db48788c91e7581ff53a097205740af";
      };
    }
