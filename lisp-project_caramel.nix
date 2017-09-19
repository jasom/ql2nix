
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_caramel-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/caramel/2013-04-20/caramel-20130420-git.tgz";
        sha256 = "8ccfb891fbefae18fd042db6b54cbf74f701a3c41b057ff6cdf97e914ca13e7a";
      };
    }
