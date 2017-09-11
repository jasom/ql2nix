
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gtk-cffi-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gtk-cffi/2016-12-04/gtk-cffi-20161204-git.tgz";
        sha256 = "24648231328dd4d7ef47cb68feee89f2476795fdc89254f154cc68271df11fb9";
      };
    }
