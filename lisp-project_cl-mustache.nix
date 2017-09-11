
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mustache-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mustache/2015-09-23/cl-mustache-20150923-git.tgz";
        sha256 = "22b0938a3765229a54bd84f70c7de2a56e8903fef4dbc987a3c8621314d800e4";
      };
    }
