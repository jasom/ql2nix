
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-partial-eval-20160531-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.partial-eval/2016-05-31/hu.dwim.partial-eval-20160531-darcs.tgz";
        sha256 = "ea455171cde12788f3c8f925cfa814b43f1eec945c406ed269605d1fb382aacb";
      };
    }
