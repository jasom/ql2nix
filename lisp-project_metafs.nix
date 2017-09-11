
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_metafs-20120909-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/metafs/2012-09-09/metafs-20120909-http.tgz";
        sha256 = "3214abb080847706b7cb0e579607227efa1ef70e0388d31eef0e302950ab02e0";
      };
    }
