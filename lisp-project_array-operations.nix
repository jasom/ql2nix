
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_array-operations-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/array-operations/2013-06-15/array-operations-20130615-git.tgz";
        sha256 = "251bd73394a0f3b478092ed439006e9a076d99ee671034216620027df3b769c9";
      };
    }
