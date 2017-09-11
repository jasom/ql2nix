
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chanl-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chanl/2016-09-29/chanl-20160929-git.tgz";
        sha256 = "10c2bca41294f53a4733aacc537832f45dc7c2b0e88c3c71110f0084de2e86ac";
      };
    }
