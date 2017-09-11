
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-features-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-features/2016-12-04/trivial-features-20161204-git.tgz";
        sha256 = "424681538abfa8c5af41fae0099c6e5cb9b05f823a094abba42fcac312f35f44";
      };
    }
