
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_south-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/south/2017-06-30/south-20170630-git.tgz";
        sha256 = "2ae8b5f8c37cf3cecd442bba49038ef5f3d9619215df8928daa92c40623a35c9";
      };
    }
