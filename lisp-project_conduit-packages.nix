
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_conduit-packages-20140826-http.package-unhack.patch];
      name = "lisp-project_conduit-packages-20140826-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/conduit-packages/2014-08-26/conduit-packages-20140826-http.tgz";
        sha256 = "d829cb364af3cad6975a620a5dfc1f88308db281524a92ba172bbbb6d7942384";
      };
    }
