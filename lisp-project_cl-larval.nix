
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-larval-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-larval/2014-08-26/cl-larval-20140826-git.tgz";
        sha256 = "2b2f10e7cdb6a3c32cb4744ea3a6189e46ec995db14cc3ac01499475c5871a19";
      };
    }
