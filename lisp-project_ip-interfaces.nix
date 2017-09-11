
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ip-interfaces-0.2.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ip-interfaces/2016-02-08/ip-interfaces-0.2.0.tgz";
        sha256 = "f2515b72d76eb99305a0d3ed4351f5be6119572dc94bcd7c22315eb0ca6696ea";
      };
    }
