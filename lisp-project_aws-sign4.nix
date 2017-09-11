
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_aws-sign4-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/aws-sign4/2014-07-13/aws-sign4-20140713-git.tgz";
        sha256 = "a64268cbfd48ca7253db0727a25838d362b5152424dde0431f80f3914bc3ff3d";
      };
    }
