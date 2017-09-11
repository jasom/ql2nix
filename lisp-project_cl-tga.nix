
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tga-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tga/2016-03-18/cl-tga-20160318-git.tgz";
        sha256 = "7301d299e37a0ca1c3d194f9e664348be7809fae8fe246aa4e7a67d9c0ee6281";
      };
    }
