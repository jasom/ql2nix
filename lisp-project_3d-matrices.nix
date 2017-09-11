
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3d-matrices-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3d-matrices/2017-06-30/3d-matrices-20170630-git.tgz";
        sha256 = "65a4f485a4724ed9f937bc7653ff64b9a9634339e2acb46739da4f2d2802ea65";
      };
    }
