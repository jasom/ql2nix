
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-launch-4.1.4.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-launch/2015-10-31/cl-launch-4.1.4.1.tgz";
        sha256 = "bf969446cd957ab867d879868a28ef63d6ebdb43933c5ace1815ac6fa7078524";
      };
    }
