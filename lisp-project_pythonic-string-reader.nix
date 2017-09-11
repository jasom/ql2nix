
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pythonic-string-reader-20120703-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pythonic-string-reader/2012-07-03/pythonic-string-reader-20120703-git.tgz";
        sha256 = "7bc6dafd23cbe84cae6a30fccdd32e870bf3ad72c4e1799e7c533a62ec0215ca";
      };
    }
