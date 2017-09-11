
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-syntax-sugar-20161204-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.syntax-sugar/2016-12-04/hu.dwim.syntax-sugar-20161204-darcs.tgz";
        sha256 = "53afb3bb4f62bd6cb7e45525b52a606db99c841272a377a04a6b6335cec59ffb";
      };
    }
