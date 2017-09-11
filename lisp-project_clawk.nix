
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clawk-20111105-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clawk/2011-11-05/clawk-20111105-git.tgz";
        sha256 = "777a90ad5f8382ccb4770ff2fb7524cada818dbe80ac648b7173e26151dca08e";
      };
    }
