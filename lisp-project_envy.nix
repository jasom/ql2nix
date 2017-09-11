
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_envy-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/envy/2014-12-17/envy-20141217-git.tgz";
        sha256 = "635751de035e472010a7ce856d201f08b3069e82e89d4d02d583574da1ea09c0";
      };
    }
