
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_intercom-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/intercom/2013-06-15/intercom-20130615-git.tgz";
        sha256 = "db70e8ca38608d5cb15fefe7553347cf200c45098a48fec899519b1426f4ccb7";
      };
    }
