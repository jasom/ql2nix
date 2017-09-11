
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_packet-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/packet/2015-03-02/packet-20150302-git.tgz";
        sha256 = "96865b2c26c671dd44606179380d952a10cdd518ce3bb9f79c46020c145a50e6";
      };
    }
