
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xml-location-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xml.location/2017-02-27/xml.location-20170227-git.tgz";
        sha256 = "fc30bddb488b733c5fbe8e963b6d85f9c73330ea000330951f5afbe23ed7b1fc";
      };
    }
