
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mk-string-metrics-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mk-string-metrics/2017-06-30/mk-string-metrics-20170630-git.tgz";
        sha256 = "9cc77087714a4b52d549a6cbad70480551456dabaa0510c444f4c4039310a0e7";
      };
    }
