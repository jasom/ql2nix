
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_map-set-20160628-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/map-set/2016-06-28/map-set-20160628-hg.tgz";
        sha256 = "3b4d99c3d0983d64b6cffc67d914122790b75abab29981a01a2514358882cb95";
      };
    }
