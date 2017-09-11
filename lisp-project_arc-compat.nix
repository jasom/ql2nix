
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_arc-compat-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/arc-compat/2015-01-13/arc-compat-20150113-git.tgz";
        sha256 = "4dc7a2e8787ea3b6b5b18294a68decfded3ef722f483e64b735e1725d7ce67a1";
      };
    }
