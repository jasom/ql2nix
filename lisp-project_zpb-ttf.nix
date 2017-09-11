
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zpb-ttf-1.0.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zpb-ttf/2013-07-20/zpb-ttf-1.0.3.tgz";
        sha256 = "4696b7ee85b52328a996d43cbf2fe2968ac07ff75242683a17912f7641033bc7";
      };
    }
