
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_flare-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/flare/2017-06-30/flare-20170630-git.tgz";
        sha256 = "64c4629403109425eea77c4dbc2a99eee157b539fd59ae22c3ac730ca851fc21";
      };
    }
