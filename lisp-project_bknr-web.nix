
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bknr-web-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bknr-web/2014-07-13/bknr-web-20140713-git.tgz";
        sha256 = "7239d8a0a33a00987367334f14b417a12fc54c9136ebcf5593b7e80d57b2c850";
      };
    }
