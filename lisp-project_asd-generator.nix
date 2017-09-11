
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asd-generator-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asd-generator/2017-01-24/asd-generator-20170124-git.tgz";
        sha256 = "59435d0ab82c32a01e5ff727082fada3daa33e4103227fe2ad8834a784364102";
      };
    }
