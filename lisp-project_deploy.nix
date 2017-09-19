
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deploy-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deploy/2017-08-30/deploy-20170830-git.tgz";
        sha256 = "72595eac7b832c98d78b0a9dcec04ecd260c09c1c2a34e67bd098ec525414246";
      };
    }
