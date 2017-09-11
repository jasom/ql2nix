
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_npg-20150517T144652";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/npg/2015-06-08/npg-20150517T144652.tgz";
        sha256 = "db58fc7708325751a9e528a11febdf39f19ac593c7cf68eb39258448b5e1b3e1";
      };
    }
