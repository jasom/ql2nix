
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ec2-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ec2/2012-09-09/ec2-20120909-git.tgz";
        sha256 = "0b51b85b2cf4ec21db52930783c0ebbbae53ea8674ec3cc1594e3474deeab936";
      };
    }
