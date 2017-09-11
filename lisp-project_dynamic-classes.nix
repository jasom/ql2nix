
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dynamic-classes-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dynamic-classes/2013-01-28/dynamic-classes-20130128-git.tgz";
        sha256 = "4a93d3a39dca61c87b29877fa9707b647fc08f117f80f2a741f649e4d04c4b44";
      };
    }
