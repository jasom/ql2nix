
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_smackjack-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/smackjack/2017-06-30/smackjack-20170630-git.tgz";
        sha256 = "9861e58d1a675496999fdb2be397614525f25934deb6c27b9b7a8ecbd4ea94ba";
      };
    }
