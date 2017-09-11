
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-variates-20140211-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-variates/2014-02-11/cl-variates-20140211-darcs.tgz";
        sha256 = "48b137113fe9ef3f3b706427e5e0ff11fa998bcf5e11e3d227ad96621d59ba85";
      };
    }
