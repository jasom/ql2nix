
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gambol-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gambol/2016-03-18/cl-gambol-20160318-git.tgz";
        sha256 = "e01567e5584955d500d23be9f660c4635e9c44f69b85b86db8d1c563510f423f";
      };
    }
