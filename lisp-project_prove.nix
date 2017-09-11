
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_prove-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/prove/2017-04-03/prove-20170403-git.tgz";
        sha256 = "f4320c5bcf55cb5f0ae4f74e75249044af242609a7a35a1f6142c89fecec3d24";
      };
    }
