
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_legion-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/legion/2015-07-09/legion-20150709-git.tgz";
        sha256 = "2c0690cbf4c975004c7c78ed05485584443996326bb6728e6eddd0c693f06dcd";
      };
    }
