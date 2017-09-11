
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_place-modifiers-2.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/place-modifiers/2012-11-25/place-modifiers-2.1.tgz";
        sha256 = "b986ca32c83e7d02db05afc0259d5b6ae5885aa57c0059c7cb445d40e82e9195";
      };
    }
