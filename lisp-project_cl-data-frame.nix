
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-data-frame-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-data-frame/2014-07-13/cl-data-frame-20140713-git.tgz";
        sha256 = "0ed5ee736327132cd854150f01743ffa116876409c4e8b28d562c53ba5796aca";
      };
    }
