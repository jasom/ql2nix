
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-selenium-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-selenium/2016-05-31/cl-selenium-20160531-git.tgz";
        sha256 = "9deb804bce77d09fc9d72912973f1c7c658fcc913d957069af94b03698edaa7e";
      };
    }
