
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cffi-objects-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cffi-objects/2014-07-13/cffi-objects-20140713-git.tgz";
        sha256 = "010a6c98b49e88517be674bb3131462e1a86fe8372c6c1e3211348aa3b2a8b74";
      };
    }
