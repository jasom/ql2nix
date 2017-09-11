
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_postoffice-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/postoffice/2012-09-09/postoffice-20120909-git.tgz";
        sha256 = "41e343abc9a89167aed6e41e5c368fc479c481731dc0c892bc6715cc9114b1ea";
      };
    }
