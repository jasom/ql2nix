
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-css-20140914-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-css/2014-09-14/cl-css-20140914-git.tgz";
        sha256 = "f6d88c40a8418e735f006e69ad407694677a998e8bc5ad3dd8657b8c41a8f29b";
      };
    }
