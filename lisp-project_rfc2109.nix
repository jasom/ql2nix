
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rfc2109-20151218-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rfc2109/2015-12-18/rfc2109-20151218-darcs.tgz";
        sha256 = "ed44429c925d66477585ba23367fa8e556e64805a180d8479fc1165937d745cf";
      };
    }
