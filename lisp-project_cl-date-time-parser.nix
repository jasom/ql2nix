
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-date-time-parser-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-date-time-parser/2014-07-13/cl-date-time-parser-20140713-git.tgz";
        sha256 = "89fd6df757dde9892a08115c8d8bd52324b4491a093affe5c871b4442ed0ad5b";
      };
    }
