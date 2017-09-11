
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_memoize-20140826-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/memoize/2014-08-26/memoize-20140826-http.tgz";
        sha256 = "35fb756176e91af6ca85b725a2ccce2cd3ab1de7f065d4120c29e6ccf588947f";
      };
    }
