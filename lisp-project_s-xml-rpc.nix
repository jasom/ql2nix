
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-xml-rpc-20101006-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-xml-rpc/2010-10-06/s-xml-rpc-20101006-http.tgz";
        sha256 = "ad6d06b3f9e55a1da680e7b76edc229f739b75f6d7c0d06be8bdcdbc4f16d2fa";
      };
    }
