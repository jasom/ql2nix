
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_illogical-pathnames-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/illogical-pathnames/2016-08-25/illogical-pathnames-20160825-git.tgz";
        sha256 = "5cf12881828f3dd42974b8fa6cbe3107f229691a8f63a000f9a168a6e2fe643f";
      };
    }
