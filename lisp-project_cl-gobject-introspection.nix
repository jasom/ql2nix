
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gobject-introspection-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gobject-introspection/2017-01-24/cl-gobject-introspection-20170124-git.tgz";
        sha256 = "1910c017871faeac01bdfe982e0be484decd43c0e879f0ca9a5aae56864011de";
      };
    }
