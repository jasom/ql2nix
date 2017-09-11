
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_network-addresses-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/network-addresses/2016-06-28/network-addresses-20160628-git.tgz";
        sha256 = "75c9186e2fdcef7ffd8f5a20575d8b052f82c6d33f1bd377812665f4adad34d5";
      };
    }
