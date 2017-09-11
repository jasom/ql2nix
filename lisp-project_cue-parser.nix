
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cue-parser-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cue-parser/2017-02-27/cue-parser-20170227-git.tgz";
        sha256 = "03003333d97cb95314e7f6a13289aac4543a70096911e728e2e7aae5eccc0c3a";
      };
    }
