
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_anaphoric-variants-1.0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/anaphoric-variants/2012-10-13/anaphoric-variants-1.0.1.tgz";
        sha256 = "6495254fd7e8268b910c90528fe53dff44334801490d44004adab54d0746e660";
      };
    }
