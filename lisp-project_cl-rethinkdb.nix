
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rethinkdb-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rethinkdb/2016-08-25/cl-rethinkdb-20160825-git.tgz";
        sha256 = "d068f0d98bf01b13bf70e80d2e92455dad9a3d8037d22d7cd6620e5be89336f0";
      };
    }
