
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-defclass-star-20150709-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.defclass-star/2015-07-09/hu.dwim.defclass-star-20150709-darcs.tgz";
        sha256 = "7a0fbd1ad8e30ca928a5d84f6c8324198a08b938057adab5061582eba940490c";
      };
    }
