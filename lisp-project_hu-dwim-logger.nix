
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-logger-20151218-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.logger/2015-12-18/hu.dwim.logger-20151218-darcs.tgz";
        sha256 = "44bc23ff8182f24dd6b537c74e4715c5e484a6716656eb88e77d1f10d63ab998";
      };
    }
