
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_epigraph-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/epigraph/2016-06-28/epigraph-20160628-git.tgz";
        sha256 = "48d5d5944d74beec0cedaa13831c6b63f416f9ca9e902bd98853519fdc3f5626";
      };
    }
