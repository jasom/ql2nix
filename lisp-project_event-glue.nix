
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_event-glue-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/event-glue/2015-06-08/event-glue-20150608-git.tgz";
        sha256 = "b015004a9167e7058956f563f5e30eff088140a0f0ac349fcc3baac043e7d80b";
      };
    }
