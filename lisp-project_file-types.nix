
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_file-types-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/file-types/2016-09-29/file-types-20160929-git.tgz";
        sha256 = "82a5384c442242d5e7829ac36a9701af55b12b44c026dd0d738f560b2ff68312";
      };
    }
