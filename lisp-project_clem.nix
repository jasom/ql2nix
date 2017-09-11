
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clem-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clem/2014-07-13/clem-20140713-git.tgz";
        sha256 = "057c6a9e58baea484b9ce8519f23f0b38bbd56675fc899f77701c5c0c9134f96";
      };
    }
