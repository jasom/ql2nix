
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_easy-routes-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/easy-routes/2017-07-25/easy-routes-20170725-git.tgz";
        sha256 = "f8ac64ab3baeb792d139a343179b068e2e4cc817beb348d4144f83cc6a3ed25e";
      };
    }
