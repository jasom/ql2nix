
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-routes-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-routes/2017-01-24/cl-routes-20170124-git.tgz";
        sha256 = "7817de62575e676f0dbff78e7b5bfeefbed5897352c4dbb20bf1ec12c1758ed3";
      };
    }
