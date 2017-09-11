
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mpc-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mpc/2016-09-29/mpc-20160929-git.tgz";
        sha256 = "eba4ccbb121015e3c6590bb614b343c1d9f4aac9b1fd26e7dcbc4c27e5685a51";
      };
    }
