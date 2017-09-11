
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_reader-interception-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/reader-interception/2015-06-08/reader-interception-20150608-git.tgz";
        sha256 = "50b880cf848972bd969bbe3a495cadb17410f6da0af75a6b4c742ffd7f41b467";
      };
    }
