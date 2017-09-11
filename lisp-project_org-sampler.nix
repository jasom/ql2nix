
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_org-sampler-0.2.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/org-sampler/2016-03-18/org-sampler-0.2.0.tgz";
        sha256 = "e9ae224ad554ca508d5144587ae65425c1c768c22c341c12fc1f4539dcedb647";
      };
    }
