
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tld-20140914-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tld/2014-09-14/cl-tld-20140914-git.tgz";
        sha256 = "d2d84f0c5bb4e36e75e4b462e4fbdb62afd00c8b87a7b100ca189df5e0476392";
      };
    }
