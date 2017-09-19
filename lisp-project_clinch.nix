
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clinch-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clinch/2017-06-30/clinch-20170630-git.tgz";
        sha256 = "45a86a3ccd7297ab3671bcfd91e5d384500eb25c2993818d5225580a236aa162";
      };
    }
