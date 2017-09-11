
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_more-conditions-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/more-conditions/2017-02-27/more-conditions-20170227-git.tgz";
        sha256 = "63bdf25170014738a4bb13edcf8970960e35a7d7478501d3df9dee8c3f56eb97";
      };
    }
