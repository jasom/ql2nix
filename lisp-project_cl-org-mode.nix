
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-org-mode-20101207-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-org-mode/2010-12-07/cl-org-mode-20101207-git.tgz";
        sha256 = "1ba932827d334b98928db3d49d79a53ba7b12303a3170f64d03b762445f62e5c";
      };
    }
