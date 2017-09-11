
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rfc3339-timestamp-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rfc3339-timestamp/2015-06-08/rfc3339-timestamp-20150608-git.tgz";
        sha256 = "007fb1384d63c953005857b430b11229ac3689a645f0df5e213ecca7caddc330";
      };
    }
