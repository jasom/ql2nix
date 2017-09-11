
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_printv-20140714-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/printv/2014-07-14/printv-20140714-git.tgz";
        sha256 = "aebc500465bf455bf2057c9654be77126c007ce444ffd7222d6a9264803df711";
      };
    }
