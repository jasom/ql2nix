
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_tiff4cl-20150804-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/tiff4cl/2015-08-04/tiff4cl-20150804-http.tgz";
        sha256 = "047788c2ea65745c842ee7b08ee9dc331fdb600b85a2111d92431514230d727a";
      };
    }
