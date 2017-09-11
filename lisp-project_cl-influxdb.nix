
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-influxdb-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-influxdb/2017-04-03/cl-influxdb-20170403-git.tgz";
        sha256 = "c4e44076e9ec4892de42423f0fe4d17fe1c1aae31bfc922047bfc2a1d03b0df7";
      };
    }
