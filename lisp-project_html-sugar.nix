
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_html-sugar-20110829-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/html-sugar/2011-08-29/html-sugar-20110829-http.tgz";
        sha256 = "011cfce88b0a9596ef06c98e4e87d5578c4dc6e343d0de5fe8316c7049dc9f77";
      };
    }
