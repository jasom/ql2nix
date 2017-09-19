
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sexml-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sexml/2014-07-13/sexml-20140713-git.tgz";
        sha256 = "7fa71d85cab36d008d33c056e9820badab1f98266f0e40e992c2b24b48dfca8e";
      };
    }
