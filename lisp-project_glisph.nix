
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glisph-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glisph/2017-04-03/glisph-20170403-git.tgz";
        sha256 = "aca8e7262a9c664052e01bfa4bc194933d71296536dd677f913473dfbacd0fcd";
      };
    }
