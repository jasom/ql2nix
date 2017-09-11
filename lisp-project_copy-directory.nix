
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_copy-directory-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/copy-directory/2016-06-28/copy-directory-20160628-git.tgz";
        sha256 = "cbedd1962a6049b4a18d3d62d4fcbcd978326e8fb28f4c4c1302f6033e647e45";
      };
    }
