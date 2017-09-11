
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_anaphora-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/anaphora/2017-02-27/anaphora-20170227-git.tgz";
        sha256 = "a9790080e92f451e4bd43ccd8accf69d1e0f2089e0de207bf4271b4fd932dbc6";
      };
    }
