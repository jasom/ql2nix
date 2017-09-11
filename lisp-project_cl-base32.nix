
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-base32-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-base32/2013-04-20/cl-base32-20130420-git.tgz";
        sha256 = "e3d1972493aca43693cc38dc3eae9db3e8e6aafb5f860e2934ce9ba7f0139b46";
      };
    }
