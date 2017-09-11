
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_delorean-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/delorean/2013-06-15/delorean-20130615-git.tgz";
        sha256 = "81ccb6e355eb696435c1d977747423d3f9f0be459f36657f5f584781cdee517a";
      };
    }
