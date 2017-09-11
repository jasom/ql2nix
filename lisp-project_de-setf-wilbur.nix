
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_de-setf-wilbur-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/de.setf.wilbur/2013-01-28/de.setf.wilbur-20130128-git.tgz";
        sha256 = "ddde96a630aa20c3771492ff0aaf3b70e020db4e57ee2918f497f96af78a381d";
      };
    }
