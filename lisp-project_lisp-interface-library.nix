
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-interface-library-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-interface-library/2016-05-31/lisp-interface-library-20160531-git.tgz";
        sha256 = "7357b4ca1d7d281c8f6292f4940dcb6a1f64455d0ba8e7a72ed4125d1cb70693";
      };
    }
