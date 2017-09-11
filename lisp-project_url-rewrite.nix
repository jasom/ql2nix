
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_url-rewrite-0.1.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/url-rewrite/2010-10-06/url-rewrite-0.1.1.tgz";
        sha256 = "184e517c1258894b32eeb6448027d4c9d6d4dfe404cc6cd280fa64e6f8b20a15";
      };
    }
