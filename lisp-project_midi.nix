
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_midi-20070618";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/midi/2010-10-06/midi-20070618.tgz";
        sha256 = "3bf2ce4577abd58fb3dcff8f2ad3bf426a929dc481b23fbb0a389be8f3fc0a1e";
      };
    }
