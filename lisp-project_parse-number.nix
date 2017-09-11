
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parse-number-1.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parse-number/2014-08-26/parse-number-1.4.tgz";
        sha256 = "90ae04cd1a43fe186d07e5f805faa6cc8a00d1134dd9d99b56e31fa2f5811279";
      };
    }
