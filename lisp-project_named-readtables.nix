
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_named-readtables-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/named-readtables/2017-01-24/named-readtables-20170124-git.tgz";
        sha256 = "85e0c01472e9360d52da707833d7e37faf2e92c769a7d600594a36a85acb0dc8";
      };
    }
