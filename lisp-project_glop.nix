
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glop-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glop/2017-06-30/glop-20170630-git.tgz";
        sha256 = "68bcc33e184f43bdc9bebe57396c692d4b4d4a3181cfb7b8bc885113c8a7b48c";
      };
    }
