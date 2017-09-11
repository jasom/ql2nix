
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glkit-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glkit/2017-07-25/glkit-20170725-git.tgz";
        sha256 = "200b379c79ff349c3d6a3cc5bcc953bcea601cae8c60979337841e2b3f433968";
      };
    }
