
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mime4cl-20150207T211851";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mime4cl/2015-03-02/mime4cl-20150207T211851.tgz";
        sha256 = "857aedca18f03d22d7189d372d7e41ff0ad4df1ebc8f15b39fb5645c10a5c1c9";
      };
    }
