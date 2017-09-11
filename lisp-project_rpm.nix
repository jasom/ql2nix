
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rpm-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rpm/2016-04-21/rpm-20160421-git.tgz";
        sha256 = "817537c45e7668ac9d110bb2735276e022bed530a969ba41c2ba251e11db9520";
      };
    }
