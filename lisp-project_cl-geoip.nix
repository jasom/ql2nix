
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-geoip-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-geoip/2013-06-15/cl-geoip-20130615-git.tgz";
        sha256 = "f151ae0e7ec6f5d0b24cdaae83ad0e68ab1ab565dc3d1167d95e36a27ebd948a";
      };
    }
