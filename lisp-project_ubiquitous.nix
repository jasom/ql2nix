
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ubiquitous-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ubiquitous/2017-06-30/ubiquitous-20170630-git.tgz";
        sha256 = "b3177ffb51ac9ca503c53e31084a8f960a95874126ab3e36054cefcab3894bbc";
      };
    }
