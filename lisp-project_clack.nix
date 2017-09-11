
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clack-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clack/2017-06-30/clack-20170630-git.tgz";
        sha256 = "6f792aece5c6f93932d63305384d2e23dbab61e10f34319fb2a47dd728cf7dfc";
      };
    }
