
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clnuplot-20130128-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clnuplot/2013-01-28/clnuplot-20130128-darcs.tgz";
        sha256 = "ad443bfb246f697f2dec39d4bb89b9701d0f3f85d97ce4a0fa9261ea03d49375";
      };
    }
