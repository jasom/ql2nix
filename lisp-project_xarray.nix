
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xarray-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xarray/2014-01-13/xarray-20140113-git.tgz";
        sha256 = "86e6f3afda3bb20e460801b6c69cef7400afa6323d4e756595173daf0925dc37";
      };
    }
