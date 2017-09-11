
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_unicly-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/unicly/2012-09-09/unicly-20120909-git.tgz";
        sha256 = "1066644a5d2b300f4a0b56ce3215a84bde4f07b1bf9cdf788d1372c3233ab46a";
      };
    }
