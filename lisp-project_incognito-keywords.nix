
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_incognito-keywords-1.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/incognito-keywords/2013-01-28/incognito-keywords-1.1.tgz";
        sha256 = "5f6f48343d3254e997f6225d523e770f85316669293dfa51871adc34e4a5fe23";
      };
    }
