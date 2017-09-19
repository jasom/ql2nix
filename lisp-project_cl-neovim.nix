
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-neovim-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-neovim/2016-09-29/cl-neovim-20160929-git.tgz";
        sha256 = "9e32377bd4db9e9d481e50d3a1b8463eb88c4b2507f20d6f17aa7df54b5ea0c4";
      };
    }
