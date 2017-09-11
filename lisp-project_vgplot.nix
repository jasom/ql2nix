
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_vgplot-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/vgplot/2017-01-24/vgplot-20170124-git.tgz";
        sha256 = "2ac2265a52bf3605a42e20f2f7a4206134eab5feb3549738df2c4d522553ea33";
      };
    }
