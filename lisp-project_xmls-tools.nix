
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xmls-tools-20110320-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xmls-tools/2011-03-20/xmls-tools-20110320-http.tgz";
        sha256 = "c9cd1019749b44b41de9b26c18be16c231a0981dba41a710acd5aa8f11ffdee6";
      };
    }
