
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cambl-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cambl/2017-04-03/cambl-20170403-git.tgz";
        sha256 = "fa82e7fb5735b378a084c7d3e850dfbe3d931e4b51baa82ca4cabc7ce3ca1844";
      };
    }
