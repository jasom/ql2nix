
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_com-clearly-useful-generic-collection-interface-20121125-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/com.clearly-useful.generic-collection-interface/2012-11-25/com.clearly-useful.generic-collection-interface-20121125-git.tgz";
        sha256 = "5217ca8ff7689e0bf3e37eb3d4c24bff4d541717c791a25f12ebeb17747eec6c";
      };
    }
