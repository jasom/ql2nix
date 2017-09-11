
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_utm-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/utm/2015-10-31/utm-20151031-git.tgz";
        sha256 = "147b2e1cbf2ee6f30efdd4d25db3010cdde942b50f497b5920559091b2d2044c";
      };
    }
