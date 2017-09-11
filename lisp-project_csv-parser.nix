
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_csv-parser-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/csv-parser/2014-07-13/csv-parser-20140713-git.tgz";
        sha256 = "c3c0bdbb672fe376289f895b2782d5d984fcff541e0908ecbb88c6fee75065e0";
      };
    }
