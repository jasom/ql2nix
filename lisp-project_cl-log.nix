
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-log.1.0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-log/2013-01-28/cl-log.1.0.1.tgz";
        sha256 = "4d7840b9e3bf5a979f780ba937f4e268c73db48e2f91f6c7c541d86e3ac0ab71";
      };
    }
