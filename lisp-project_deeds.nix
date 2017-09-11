
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deeds-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deeds/2017-07-25/deeds-20170725-git.tgz";
        sha256 = "a84ebedbac44a427a2ce417d9e121c8ae179c9dda643a0fb9838794dfcff1e7a";
      };
    }
