
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_restas-file-publisher-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/restas.file-publisher/2012-01-07/restas.file-publisher-20120107-git.tgz";
        sha256 = "2838bb2993e1cc72cf5230bf12c6d44f1c69d0273c18912bc56bd62a86dc3aad";
      };
    }
