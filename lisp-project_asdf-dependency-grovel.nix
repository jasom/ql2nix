
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-dependency-grovel-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-dependency-grovel/2017-04-03/asdf-dependency-grovel-20170403-git.tgz";
        sha256 = "1a783a9f6b7216d71efb3611082f335746f013e3ad09ef1d035f7f957bf64fc1";
      };
    }
