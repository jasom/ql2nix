
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-asdf-20170630-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.asdf/2017-06-30/hu.dwim.asdf-20170630-darcs.tgz";
        sha256 = "cb81de5e4458389045924f21a46dfa3a2c44b087bf0c83c3875d9ac680263494";
      };
    }
