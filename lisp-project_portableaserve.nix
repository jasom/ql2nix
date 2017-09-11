
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_portableaserve-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/portableaserve/2015-09-23/portableaserve-20150923-git.tgz";
        sha256 = "967252c38b5b766434b34cf567e2506f05f1206e38c7a27d4ad3d88b0071d116";
      };
    }
