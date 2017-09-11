
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-one-time-passwords-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-one-time-passwords/2013-04-20/cl-one-time-passwords-20130420-git.tgz";
        sha256 = "1f30d3fd272d6d13d5fae3291da17de9ffcdb86a1c18ea229d761e5ed9e00e16";
      };
    }
