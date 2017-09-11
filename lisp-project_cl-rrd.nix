
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rrd-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rrd/2013-01-28/cl-rrd-20130128-git.tgz";
        sha256 = "bf26fdaf3ed45ccb7e0528e3e2474e57889daea4a5401684dfca35e74cf7ff11";
      };
    }
