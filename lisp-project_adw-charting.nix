
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_adw-charting-20120909-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/adw-charting/2012-09-09/adw-charting-20120909-http.tgz";
        sha256 = "64bc4122e706db94e5e602ecf8bd93d08b1dc6f779c08a4bd886c1b24830ccd4";
      };
    }
