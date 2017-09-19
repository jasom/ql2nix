
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rdfxml-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rdfxml/2014-07-13/cl-rdfxml-20140713-git.tgz";
        sha256 = "08310754e3dc62042b6439510621cba2e91e640d66abc80db9fcd8ff3dbaa662";
      };
    }
